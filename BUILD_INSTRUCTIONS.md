# BeimoChat 构建说明

## 📱 项目概述

BeimoChat 是一个基于 Flutter 的聊天应用，具有照片管理、用户封禁和分销商系统等功能。

## 🛠️ 本地构建

### 环境要求

- Flutter 3.27.1
- Dart SDK >=3.3.4 <4.0.0
- Android Studio / Xcode
- Git

### iOS 构建

1. **安装依赖**
   ```bash
   flutter pub get
   cd ios && pod install && cd ..
   ```

2. **构建 iOS 应用**
   ```bash
   # 使用脚本构建
   chmod +x scripts/build-ios.sh
   ./scripts/build-ios.sh
   
   # 或手动构建
   flutter build ios --release --no-codesign
   ```

3. **导出 IPA**
   ```bash
   cd ios
   xcodebuild -workspace Runner.xcworkspace -scheme Runner -configuration Release -destination generic/platform=iOS -archivePath Runner.xcarchive archive
   xcodebuild -exportArchive -archivePath Runner.xcarchive -exportPath build -exportOptionsPlist ExportOptions.plist
   ```

### Android 构建

1. **安装依赖**
   ```bash
   flutter pub get
   ```

2. **构建 Android 应用**
   ```bash
   # 使用脚本构建
   chmod +x scripts/build-android.sh
   ./scripts/build-android.sh
   
   # 或手动构建
   flutter build apk --release
   flutter build appbundle --release
   ```

## 🚀 GitHub Actions 自动构建

### 工作流说明

1. **Flutter Check** (`flutter-check.yml`)
   - 代码分析
   - 运行测试
   - 格式检查

2. **iOS Build** (`ios-build.yml`)
   - 构建 iOS 应用
   - 生成 IPA 文件
   - 上传构建产物

3. **Android Build** (`android-build.yml`)
   - 构建 Android APK 和 AAB
   - 上传构建产物

4. **Release** (`release.yml`)
   - 发布版本构建
   - 支持标签触发

### 触发条件

- 推送到 `photo-management` 或 `main` 分支
- 创建 Pull Request
- 手动触发 (`workflow_dispatch`)
- 创建版本标签 (`v*`)

## 📦 构建产物

### iOS
- **IPA 文件**: `ios/build/*.ipa`
- **保留时间**: 30天 (普通构建) / 90天 (发布构建)

### Android
- **APK 文件**: `build/app/outputs/flutter-apk/app-release.apk`
- **AAB 文件**: `build/app/outputs/bundle/release/app-release.aab`
- **保留时间**: 30天 (普通构建) / 90天 (发布构建)

## 🔧 配置说明

### iOS 配置

1. **ExportOptions.plist**
   - 配置导出方法为 `development`
   - 需要替换 `YOUR_TEAM_ID` 为实际的 Team ID

2. **Info.plist**
   - 应用显示名称: BeimoChat
   - 支持所有设备方向

### Android 配置

1. **build.gradle**
   - 目标 SDK: 34
   - 最小 SDK: 21
   - 编译 SDK: 34

## 🐛 故障排除

### 常见问题

1. **iOS 构建失败**
   - 检查 Xcode 版本
   - 确认证书配置
   - 检查 Team ID 设置

2. **Android 构建失败**
   - 检查 Java 版本 (需要 17)
   - 确认 Android SDK 配置
   - 检查 Gradle 版本

3. **依赖问题**
   - 运行 `flutter clean`
   - 删除 `pubspec.lock`
   - 重新运行 `flutter pub get`

## 📞 支持

如有问题，请查看：
- GitHub Issues
- Flutter 官方文档
- 项目 README.md
