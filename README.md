
# Covid-19 Tester

This is a Coronavirus Tester mobile application. I made it public because Google Play or Apple App Store do not allow uploading Covid-19 applications if you are not government :)

This application contains questions to learn the COVID-19 status of the user. It does not give exact result, it only gives an idea about your status and sugges what you can do in next step.

I used the most seen symptomps to create the questions in the app. Also, I applied a doctor to refine the questions.


## Tech Stack

- Google Flutter
- Dart

Google developed Flutter to perform write once run on every platform. So, you can run this application on iOS or android or web. Dart is the programming language used in Flutter.

## What You Can Learn

You can learn how a basic Flutter application can be by investigating the codebase.  
Topics related with Flutter such as *L/F components usage, custom UI design, localization, animation, navigation between screens*  can be learned.

## How to run

- First step is to install flutter on your computer.
- Run `flutter doctor` on your terminal to see what is missing on your computer to run Flutter apps and install and configure the items.
- You can use Android Studio to run or customize the application

## Important

If you add any text to application, it should be localized. Currently, app supports English and Turkish. You should add a variable to localizations.dart file for the text. Then,

run:
`flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/localizations.dart`

This will generate new text key in I10n/intl_messages.arb. Copy that block and paste it to other intl_* files and make the necessary translations. Then,

run:
`flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n \
   --no-use-deferred-loading lib/localizations.dart lib/l10n/intl_*.arb`

Reference: https://proandroiddev.com/flutter-localization-step-by-step-30f95d06018d

## ScreenShots From Android Nexus Simulator

<img src="assets/images/scrshots/android/Screenshot_1595285748.png" width="250"/>
&nbsp;
<img src="assets/images/scrshots/android/Screenshot_1595285804.png" width="250"/>
&nbsp;
<img src="assets/images/scrshots/android/Screenshot_1595285831.png" width="250"/>

## ScreenShots From iPhone 11 Simulator

<img src="assets/images/scrshots/iphone/home.png" width="250"/>
&nbsp;
<img src="assets/images/scrshots/iphone/breathing.png" width="250"/>
&nbsp;
<img src="assets/images/scrshots/iphone/result.png" width="250"/>
