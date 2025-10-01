@echo off
"C:\\Users\\Administrator\\AppData\\Local\\Android\\sdk\\cmake\\3.18.1\\bin\\cmake.exe" ^
  "-HC:\\Users\\Administrator\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\pdf_render-1.4.12\\android" ^
  "-DCMAKE_SYSTEM_NAME=Android" ^
  "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON" ^
  "-DCMAKE_SYSTEM_VERSION=21" ^
  "-DANDROID_PLATFORM=android-21" ^
  "-DANDROID_ABI=x86_64" ^
  "-DCMAKE_ANDROID_ARCH_ABI=x86_64" ^
  "-DANDROID_NDK=C:\\Users\\Administrator\\AppData\\Local\\Android\\sdk\\ndk\\23.1.7779620" ^
  "-DCMAKE_ANDROID_NDK=C:\\Users\\Administrator\\AppData\\Local\\Android\\sdk\\ndk\\23.1.7779620" ^
  "-DCMAKE_TOOLCHAIN_FILE=C:\\Users\\Administrator\\AppData\\Local\\Android\\sdk\\ndk\\23.1.7779620\\build\\cmake\\android.toolchain.cmake" ^
  "-DCMAKE_MAKE_PROGRAM=C:\\Users\\Administrator\\AppData\\Local\\Android\\sdk\\cmake\\3.18.1\\bin\\ninja.exe" ^
  "-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=E:\\AI\\cursor\\ChatApp\\app\\whoxa-flutter-app\\beimo\\build\\pdf_render\\intermediates\\cxx\\RelWithDebInfo\\3hv1j5m3\\obj\\x86_64" ^
  "-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=E:\\AI\\cursor\\ChatApp\\app\\whoxa-flutter-app\\beimo\\build\\pdf_render\\intermediates\\cxx\\RelWithDebInfo\\3hv1j5m3\\obj\\x86_64" ^
  "-DCMAKE_BUILD_TYPE=RelWithDebInfo" ^
  "-BC:\\Users\\Administrator\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\pdf_render-1.4.12\\android\\.cxx\\RelWithDebInfo\\3hv1j5m3\\x86_64" ^
  -GNinja
