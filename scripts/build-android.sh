#!/bin/bash

# Android Build Script for BeimoChat
# This script builds the Android app and creates APK and AAB files

set -e

echo "🚀 Starting Android build process..."

# Check if we're in the right directory
if [ ! -f "pubspec.yaml" ]; then
    echo "❌ Error: pubspec.yaml not found. Please run this script from the Flutter project root."
    exit 1
fi

# Get Flutter dependencies
echo "📦 Getting Flutter dependencies..."
flutter pub get

# Build Android APK
echo "🔨 Building Android APK..."
flutter build apk --release

# Build Android AAB
echo "🔨 Building Android AAB..."
flutter build appbundle --release

echo "✅ Android build completed successfully!"
echo "📱 APK file location: build/app/outputs/flutter-apk/app-release.apk"
echo "📱 AAB file location: build/app/outputs/bundle/release/app-release.aab"
