This is a minimal complete reproducible code sample for https://github.com/flutter/flutter/issues/86261

#### step to reproduce
1. Click red button to present Page B，witch height is 600
2. Click Textfield to pop up keybord
3. Filter log with keyword "screen_height"

**Expected results:** <!-- what did you want to see? -->
After clicking Textfield to pop up keybord，The printed `screen_height` is always 600.

**Actual results:** <!-- what did you see? -->
After clicking Textfield to pop up keybord，in addition to 600, there is another value, this value comes from FlutterViewControllerA.In my case，It is 812，the height of the phone screen.

```
2021-07-13 17:18:10.263508+0800 Runner[758:139869] flutter: screen_height : 812.0
2021-07-13 17:18:10.263709+0800 Runner[758:139869] flutter: screen_height : 600.0
2021-07-13 17:18:10.271569+0800 Runner[758:139869] flutter: screen_height : 812.0
2021-07-13 17:18:10.271656+0800 Runner[758:139869] flutter: screen_height : 600.0
```

flutter doctor -v
```
[✓] Flutter (Channel master, 2.4.0-1.0.pre.199, on macOS 11.1 20C69 darwin-x64, locale zh-Hans-CN)
    • Flutter version 2.4.0-1.0.pre.199
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision abbed87d65 (10 hours ago), 2021-07-12 19:26:04 -0400
    • Engine revision a984a833ba
    • Dart version 2.14.0 (build 2.14.0-301.0.dev)
    • Pub download mirror https://pub.flutter-io.cn
    • Flutter download mirror https://storage.flutter-io.cn

[!] Android toolchain - develop for Android devices (Android SDK version 30.0.1)
    ✗ cmdline-tools component is missing
      Run `path/to/sdkmanager --install "cmdline-tools;latest"`
      See https://developer.android.com/studio/command-line for more details.
    ✗ Android license status unknown.
      Run `flutter doctor --android-licenses` to accept the SDK licenses.
      See https://flutter.dev/docs/get-started/install/macos#android-setup for more details.

[!] Xcode - develop for iOS and macOS
    • Xcode at /Applications/Xcode.app/Contents/Developer
    • Xcode 12.5, Build version 12E262
    ! CocoaPods 1.8.4 out of date (1.10.0 is recommended).
        CocoaPods is used to retrieve the iOS and macOS platform side's plugin code that responds to your plugin usage on the Dart side.
        Without CocoaPods, plugins will not work on iOS or macOS.
        For more info, see https://flutter.dev/platform-plugins
      To upgrade see https://guides.cocoapods.org/using/getting-started.html#installation for instructions.

[✓] Chrome - develop for the web
    • Chrome at /Applications/Google Chrome.app/Contents/MacOS/Google Chrome

[✓] Android Studio (version 4.0)
    • Android Studio at /Applications/Android Studio.app/Contents
    • Flutter plugin version 51.0.1
    • Dart plugin version 193.7547
    • Java version OpenJDK Runtime Environment (build 1.8.0_242-release-1644-b3-6222593)

[✓] IntelliJ IDEA Community Edition (version 2017.3.3)
    • IntelliJ at /Applications/IntelliJ IDEA CE.app
    • Flutter plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/6351-dart

[✓] VS Code (version 1.57.1)
    • VS Code at /Applications/Visual Studio Code.app/Contents
    • Flutter extension version 3.23.0
```
