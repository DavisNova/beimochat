#!/bin/bash

# iOS Build Script for BeimoChat
# This script builds the iOS app and creates an IPA file

set -e

echo "🚀 Starting iOS build process..."

# Check if we're in the right directory
if [ ! -f "pubspec.yaml" ]; then
    echo "❌ Error: pubspec.yaml not found. Please run this script from the Flutter project root."
    exit 1
fi

# Get Flutter dependencies
echo "📦 Getting Flutter dependencies..."
flutter pub get

# Install iOS dependencies
echo "🍎 Installing iOS dependencies..."
cd ios
pod install
cd ..

# Build iOS app
echo "🔨 Building iOS app..."
flutter build ios --release --no-codesign

# Archive iOS app
echo "📦 Archiving iOS app..."
cd ios
xcodebuild -workspace Runner.xcworkspace \
           -scheme Runner \
           -configuration Release \
           -destination generic/platform=iOS \
           -archivePath Runner.xcarchive \
           archive

# Export IPA
echo "📱 Exporting IPA..."
xcodebuild -exportArchive \
           -archivePath Runner.xcarchive \
           -exportPath build \
           -exportOptionsPlist ExportOptions.plist

echo "✅ iOS build completed successfully!"
echo "📱 IPA file location: ios/build/*.ipa"
