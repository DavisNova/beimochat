@echo off
echo 🔧 测试iOS构建脚本
echo ==================

REM 检查Flutter环境
echo 1. 检查Flutter环境...
flutter --version

REM 清理并重新获取依赖
echo 2. 清理并重新获取依赖...
flutter clean
flutter pub get

REM 检查Generated.xcconfig文件
echo 3. 检查Generated.xcconfig文件...
if exist "ios\Flutter\Generated.xcconfig" (
    echo ✅ Generated.xcconfig 存在
    echo 内容：
    type ios\Flutter\Generated.xcconfig
) else (
    echo ❌ Generated.xcconfig 不存在
    echo 尝试重新生成...
    flutter pub get
    if exist "ios\Flutter\Generated.xcconfig" (
        echo ✅ 重新生成成功
        type ios\Flutter\Generated.xcconfig
    ) else (
        echo ❌ 重新生成失败
        exit /b 1
    )
)

REM 清理iOS构建缓存
echo 4. 清理iOS构建缓存...
cd ios
if exist "Pods" rmdir /s /q "Pods"
if exist "Podfile.lock" del "Podfile.lock"
cd ..

REM 安装iOS依赖
echo 5. 安装iOS依赖...
cd ios
pod install --repo-update
cd ..

REM 尝试构建
echo 6. 尝试构建iOS应用...
flutter build ios --debug --no-codesign

echo ✅ 测试完成！
pause
