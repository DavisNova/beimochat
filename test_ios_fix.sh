#!/bin/bash

echo "🔧 测试iOS构建修复脚本"
echo "================================"

# 进入beimo目录
cd "$(dirname "$0")"

echo "📱 检查Flutter环境..."
flutter --version

echo "📦 安装依赖..."
flutter pub get

echo "🍎 进入iOS目录并安装Pods..."
cd ios

echo "🔧 运行pod install..."
pod install

echo "✅ 检查脚本权限修复..."
find Pods -type f -name "*.sh" -exec chmod +x {} \;

echo "🔍 验证WebRTC-SDK脚本权限..."
if [ -f "Pods/Target Support Files/WebRTC-SDK/WebRTC-SDK-xcframeworks.sh" ]; then
    echo "WebRTC-SDK脚本存在，检查权限:"
    ls -la "Pods/Target Support Files/WebRTC-SDK/WebRTC-SDK-xcframeworks.sh"
else
    echo "WebRTC-SDK脚本不存在"
fi

echo "🔍 检查所有.sh脚本权限..."
find Pods -type f -name "*.sh" -exec ls -la {} \;

echo "🏗️ 测试iOS构建..."
cd ..
flutter build ios --debug --no-codesign

echo "✅ 测试完成！"
