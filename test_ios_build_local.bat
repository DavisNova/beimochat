@echo off
echo 🔧 本地iOS构建测试脚本 (无签名版本)
echo =====================================

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

REM 构建Debug版本
echo 6. 构建Debug版本...
flutter build ios --debug --no-codesign

REM 构建Release版本
echo 7. 构建Release版本...
flutter build ios --release --no-codesign

REM 列出构建输出
echo 8. 列出构建输出...
echo === Debug Build Output ===
dir /s /b build\ios\*.app
echo === Release Build Output ===
dir /s /b build\ios\*.app

echo ✅ 测试完成！
echo 构建文件位置：
echo - Debug: build\ios\iphoneos\Debug-iphoneos\Runner.app
echo - Release: build\ios\iphoneos\Release-iphoneos\Runner.app
pause
