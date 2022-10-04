# whatodo

A new Flutter application that handles task management and todo tracking

## Getting Started

This project is a starting point my Flutter journey.

A few resources that got me started in my first Flutter project:
- Cubit State Management 
- Hive box 

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



##############################################
name: whatodo
description: A new Flutter application that handles task management and todo tracker

# The following line prevents the package from being accidentally published to
# pub.dev using `flutter pub publish`. This is preferred for private packages.
publish_to: 'none' # Remove this line if you wish to publish to pub.dev

# The following defines the version and build number for your application.
# A version number is three numbers separated by dots, like 1.2.43
# followed by an optional build number separated by a +.
# Both the version and the builder number may be overridden in flutter
# build by specifying --build-name and --build-number, respectively.
# In Android, build-name is used as versionName while build-number used as versionCode.
# Read more about Android versioning at https://developer.android.com/studio/publish/versioning
# In iOS, build-name is used as CFBundleShortVersionString while build-number used as CFBundleVersion.
# Read more about iOS versioning at
# https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
version: 1.0.0+1

environment:
  sdk: '>=2.15.1 <3.0.0'

# Dependencies specify other packages that your package needs in order to work.
# To automatically upgrade your package dependencies to the latest versions
# consider running `flutter pub upgrade --major-versions`. Alternatively,
# dependencies can be manually updated by changing the version numbers below to
# the latest version available on pub.dev. To see which dependencies have newer
# versions available, run `flutter pub outdated`.
dependencies:
  flutter:
    sdk: flutter
  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  bloc: ^8.0.3
  # cloud_firestore: ^3.4.5
  cupertino_icons: ^1.0.3
  dio: ^4.0.6
  email_validator: ^2.0.1
  equatable: ^2.0.3
  file_picker: ^4.5.1
  flutter_bloc: ^8.0.1
  flutter_slidable: ^1.2.1
  fluttertoast: ^8.0.9
  # flutter_sound_lite: ^8.1.9
  firebase_auth: ^3.3.4
  firebase_core: ^1.17.0
  # firebase_storage: ^10.2.16
  gallery_saver: ^2.3.2
  http: ^0.13.4
  intl: ^0.17.0
  permission_handler: ^8.1.2
  syncfusion_flutter_datepicker: ^20.2.48
  material_design_icons_flutter: ^5.0.6996
  shared_preferences: ^2.0.15
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  path_provider: ^2.0.11

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_launcher_icons: ^0.9.2

  # The "flutter_lints" package below contains a set of recommended lints to
  # encourage good coding practices. The lint set provided by the package is
  # activated in the `analysis_options.yaml` file located at the root of your
  # package. See that file for information about deactivating specific lint
  # rules and activating additional ones.
  flutter_lints: ^1.0.0
  hive_generator: ^1.1.3
  build_runner: ^2.2.0
# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec
flutter_icons:
  android: true
  ios: true
  image_path: 'assets/icon-2.png'

# The following section is specific to Flutter.
flutter:
  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true
  # To add assets to your application, add an assets section, like this:
  assets:
    - Images/
  #   - images/a_dot_ham.jpeg

  # An image asset can refer to one or more resolution-specific "variants", see
  # https://flutter.dev/assets-and-images/#resolution-aware.

  # For details regarding adding assets from package dependencies, see
  # https://flutter.dev/assets-and-images/#from-packages

  # To add custom fonts to your application, add a fonts section here,
  # in this "flutter" section. Each entry in this list should have a
  # "family" key with the font family name, and a "fonts" key with a
  # list giving the asset and other descriptors for the font. For
  # example:
  fonts:
    - family: Montserrat
      fonts:
        - asset: Fonts/Montserrat-Black.ttf
          weight: 900
        - asset: Fonts/Montserrat-Bold.ttf
          weight: 700
        - asset: Fonts/Montserrat-Regular.ttf
          weight: 400
        - asset: Fonts/Montserrat-Thin.ttf
          weight: 200
    - family: San
      fonts:
        - asset: Fonts/SFUIDisplay-Black.otf
          weight: 900
        - asset: Fonts/SFUIDisplay-Heavy.otf
          weight: 700
        - asset: Fonts/SFUIDisplay-Regular.otf
          weight: 400
        - asset: Fonts/SFUIDisplay-Thin.otf
          weight: 200
    - family: MyFlutterApp
      fonts:
        - asset: Fonts/MyFlutterApp.ttf

  #       - asset: fonts/Schyler-Italic.ttf
  #   - family: Trajan Pro
  #     fonts:
  #       - asset: fonts/TrajanPro.ttf
  #       - asset: fonts/TrajanPro_Bold.ttf
  #         weight: 700
  #       - asset: fonts/TrajanPro_Italic.ttf
  #         style: italic
  #
  # For details regarding fonts from package dependencies,
  # see https://flutter.dev/custom-fonts/#from-packages
