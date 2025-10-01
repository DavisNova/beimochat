@echo off
"C:\\Users\\Administrator\\AppData\\Local\\Android\\sdk\\cmake\\3.18.1\\bin\\cmake.exe" ^
  "-HC:\\Users\\Administrator\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\pdf_render-1.4.12\\android" ^
  "-DCMAKE_SYSTEM_NAME=Android" ^
  "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON" ^
  "-DCMAKE_SYSTEM_VERSION=21" ^
  "-DANDROID_PLATFORM=android-21" ^
  "-DANDROID_ABI=armeabi-v7a" ^
  "-DCMAKE_ANDROID_ARCH_ABI=armeabi-v7a" ^
  "-DANDROID_NDK=C:\\Users\\Administrator\\AppData\\Local\\Android\\sdk\\ndk\\23.1.7779620" ^
  "-DCMAKE_ANDROID_NDK=C:\\Users\\Administrator\\AppData\\Local\\Android\\sdk\\ndk\\23.1.7779620" ^
  "-DCMAKE_TOOLCHAIN_FILE=C:\\Users\\Administrator\\AppData\\Local\\Android\\sdk\\ndk\\23.1.7779620\\build\\cmake\\android.toolchain.cmake" ^
  "-DCMAKE_MAKE_PROGRAM=C:\\Users\\Administrator\\AppData\\Local\\Android\\sdk\\cmake\\3.18.1\\bin\\ninja.exe" ^
  "-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=E:\\AI\\cursor\\ChatApp\\app\\whoxa-flutter-app\\beimo\\build\\pdf_render\\intermediates\\cxx\\Debug\\5r2h1ia3\\obj\\armeabi-v7a" ^
  "-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=E:\\AI\\cursor\\ChatApp\\app\\whoxa-flutter-app\\beimo\\build\\pdf_render\\intermediates\\cxx\\Debug\\5r2h1ia3\\obj\\armeabi-v7a" ^
  "-DCMAKE_BUILD_TYPE=Debug" ^
  "-BC:\\Users\\Administrator\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\pdf_render-1.4.12\\android\\.cxx\\Debug\\5r2h1ia3\\armeabi-v7a" ^
  -GNinja
