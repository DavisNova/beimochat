@echo off
echo 🔧 测试IPA创建脚本
echo ==================

REM 检查Flutter环境
echo 1. 检查Flutter环境...
flutter --version

REM 清理并重新获取依赖
echo 2. 清理并重新获取依赖...
flutter clean
flutter pub get

REM 安装iOS依赖
echo 3. 安装iOS依赖...
cd ios
pod install --repo-update
cd ..

REM 构建Debug版本
echo 4. 构建Debug版本...
flutter build ios --debug --no-codesign

REM 创建Debug IPA
echo 5. 创建Debug IPA...
cd build\ios\iphoneos
mkdir Payload
xcopy /E /I Runner.app Payload\Runner.app
cd ..\..\..
powershell Compress-Archive -Path "build\ios\iphoneos\Payload\*" -DestinationPath "Runner-Debug.ipa" -Force

REM 构建Release版本
echo 6. 构建Release版本...
flutter build ios --release --no-codesign

REM 创建Release IPA
echo 7. 创建Release IPA...
cd build\ios\iphoneos
if exist Payload rmdir /s /q Payload
mkdir Payload
xcopy /E /I Runner.app Payload\Runner.app
cd ..\..\..
powershell Compress-Archive -Path "build\ios\iphoneos\Payload\*" -DestinationPath "Runner-Release.ipa" -Force

REM 检查生成的IPA文件
echo 8. 检查生成的IPA文件...
dir *.ipa

echo ✅ 测试完成！
echo 生成的IPA文件：
echo - Runner-Debug.ipa
echo - Runner-Release.ipa
pause
