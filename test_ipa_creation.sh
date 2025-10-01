#!/bin/bash

echo "🔧 测试IPA创建脚本"
echo "=================="

# 检查Flutter环境
echo "1. 检查Flutter环境..."
flutter --version

# 清理并重新获取依赖
echo "2. 清理并重新获取依赖..."
flutter clean
flutter pub get

# 安装iOS依赖
echo "3. 安装iOS依赖..."
cd ios
pod install --repo-update
cd ..

# 构建Debug版本
echo "4. 构建Debug版本..."
flutter build ios --debug --no-codesign

# 创建Debug IPA
echo "5. 创建Debug IPA..."
cd build/ios/iphoneos
mkdir -p Payload
cp -r Runner.app Payload/
zip -r ../../../Runner-Debug.ipa Payload/
cd ../../..

# 构建Release版本
echo "6. 构建Release版本..."
flutter build ios --release --no-codesign

# 创建Release IPA
echo "7. 创建Release IPA..."
cd build/ios/iphoneos
mkdir -p Payload
cp -r Runner.app Payload/
zip -r ../../../Runner-Release.ipa Payload/
cd ../../..

# 检查生成的IPA文件
echo "8. 检查生成的IPA文件..."
ls -la *.ipa

echo "✅ 测试完成！"
echo "生成的IPA文件："
echo "- Runner-Debug.ipa"
echo "- Runner-Release.ipa"
