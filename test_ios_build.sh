#!/bin/bash

echo "🔧 测试iOS构建脚本"
echo "=================="

# 检查Flutter环境
echo "1. 检查Flutter环境..."
flutter --version

# 清理并重新获取依赖
echo "2. 清理并重新获取依赖..."
flutter clean
flutter pub get

# 检查Generated.xcconfig文件
echo "3. 检查Generated.xcconfig文件..."
if [ -f "ios/Flutter/Generated.xcconfig" ]; then
    echo "✅ Generated.xcconfig 存在"
    echo "内容："
    cat ios/Flutter/Generated.xcconfig
else
    echo "❌ Generated.xcconfig 不存在"
    echo "尝试重新生成..."
    flutter pub get
    if [ -f "ios/Flutter/Generated.xcconfig" ]; then
        echo "✅ 重新生成成功"
        cat ios/Flutter/Generated.xcconfig
    else
        echo "❌ 重新生成失败"
        exit 1
    fi
fi

# 清理iOS构建缓存
echo "4. 清理iOS构建缓存..."
cd ios
rm -rf Pods/
rm -f Podfile.lock
cd ..

# 安装iOS依赖
echo "5. 安装iOS依赖..."
cd ios
pod install --repo-update
cd ..

# 检查脚本权限
echo "6. 检查脚本权限..."
find ios/Pods -type f -name "*.sh" -exec chmod +x {} \;

# 尝试构建
echo "7. 尝试构建iOS应用..."
flutter build ios --debug --no-codesign

echo "✅ 测试完成！"
