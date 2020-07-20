import 'package:coronavirustester/general_checks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: StartTestButton(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Locale("en"), Locale("tr")],
      onGenerateTitle: (BuildContext context) =>
      AppLocalizations.of(context).title_covid19_tester,
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        scaffoldBackgroundColor: Colors.grey[200],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        unselectedWidgetColor: Colors.redAccent,
        accentColor: Colors.redAccent,
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 18, color: Colors.grey[700]),
          button: TextStyle(color: Colors.white),
          bodyText2: TextStyle(fontSize: 20, color: Colors.redAccent),
        )
      ),
    );
  }
}
