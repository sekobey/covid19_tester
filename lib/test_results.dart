import 'dart:ui';

import 'package:coronavirustester/general_checks.dart';
import 'package:coronavirustester/localizations.dart';
import 'package:flutter/material.dart';

import 'main.dart';

enum Result {
  emergency,
  shouldGoHospital,
  betterGoHospital,
  takeCare,
  noWorries
}

class Answers {
  static bool isBreathKept = true;
  static double fever;
  static String country;
  static String gender;
  static int birthYear;
  static bool coughing = false;
  static bool tired = false;
  static bool chronic = false;
  static final Map map = {
    '00000': Result.noWorries,
    '000001': Result.noWorries,
    '000011': Result.takeCare,
    '00010': Result.shouldGoHospital,
    '00011': Result.emergency,
    '00100': Result.noWorries,
    '001010': Result.emergency,
    '001011': Result.shouldGoHospital,
    '00110': Result.shouldGoHospital,
    '00111': Result.emergency,
    '01000': Result.takeCare,
    '01001': Result.shouldGoHospital,
    '01010': Result.emergency,
    '01011': Result.emergency,
    '01100': Result.betterGoHospital,
    '011010': Result.emergency,
    '011011': Result.shouldGoHospital,
    '01110': Result.emergency,
    '01111': Result.emergency,
    '10000': Result.noWorries,
    '100010': Result.betterGoHospital,
    '100011': Result.takeCare,
    '10010': Result.betterGoHospital,
    '10011': Result.emergency,
    '10100': Result.noWorries,
    '101010': Result.emergency,
    '101011': Result.shouldGoHospital,
    '10110': Result.emergency,
    '10111': Result.emergency,
    '11000': Result.noWorries,
    '110010': Result.emergency,
    '110011': Result.shouldGoHospital,
    '11010': Result.shouldGoHospital,
    '11011': Result.emergency,
    '11100': Result.betterGoHospital,
    '111010': Result.emergency,
    '111011': Result.shouldGoHospital,
    '11110': Result.emergency,
    '11111': Result.emergency
  };

  static bool _isOld() {
    return DateTime.now().year - birthYear >= 60;
  }

  static bool _isHighFever() {
    return fever >= 37.5;
  }

  static Result result() {
    var buf = new StringBuffer();
    buf.write(tired ? '1' : '0');
    buf.write(coughing ? '1' : '0');
    buf.write(chronic ? '1' : '0');
    buf.write(_isHighFever() ? '1' : '0');
    buf.write(isBreathKept ? '0' : '1');

    if (map[buf.toString()] != null)
      return map[buf.toString()];
    else {
      buf.write(_isOld() ? '1' : '0');
      return map[buf.toString()];
    }
  }

  static String getResults() {
    return '''
     TestResults{
         isBreathKept: $isBreathKept,
         fever: $fever,
         country: $country,
         gender: $gender,
         birthYear: $birthYear,
         coughing: $coughing,
         tired: $tired,
         chronic: $chronic}
     ''';
  }

  static void rollback() {
    isBreathKept = true;
    fever = 36.5;
    country = null;
    gender = null;
    birthYear = null;
    coughing = false;
    tired = false;
    chronic = false;
  }
}

class TestResults extends StatelessWidget {
  String _getResultImage() {
    switch (Answers.result()) {
      case Result.noWorries:
        return 'Home_noworries.png';
      case Result.takeCare:
        return 'Home_takecare.png';
      case Result.betterGoHospital:
        return 'Better_go_hospital.png';
      case Result.shouldGoHospital:
        return 'Should_go_hospital.png';
      case Result.emergency:
        return 'Emergency.png';
      default:
        return '';
    }
  }

  String _getResultTitle(BuildContext context) {
    switch (Answers.result()) {
      case Result.noWorries:
        return AppLocalizations.of(context).title_noWorries;
      case Result.takeCare:
        return AppLocalizations.of(context).title_takeCare;
      case Result.betterGoHospital:
        return AppLocalizations.of(context).title_betterGoHospital;
      case Result.shouldGoHospital:
        return AppLocalizations.of(context).title_shouldGoHospital;
      case Result.emergency:
        return AppLocalizations.of(context).title_emergency;
      default:
        return '';
    }
  }

  String _getResultText(BuildContext context) {
    switch (Answers.result()) {
      case Result.noWorries:
        return AppLocalizations.of(context).info_noWorries;
      case Result.takeCare:
        return AppLocalizations.of(context).info_takeCare;
      case Result.betterGoHospital:
        return AppLocalizations.of(context).info_betterGoHospital;
      case Result.shouldGoHospital:
        return AppLocalizations.of(context).info_shouldGoHospital;
      case Result.emergency:
        return AppLocalizations.of(context).info_emergency;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).title_test_result),
        centerTitle: true,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.content_paste))
        ],
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Image(
                    image:
                        AssetImage('assets/images/3.0x/${_getResultImage()}'))),
            Text(_getResultTitle(context),
                style: TextStyle(
                    fontSize: 25,
                    color: themeData.accentColor,
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(_getResultText(context), textAlign: TextAlign.center),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: FlatButton(
                    child: Text(AppLocalizations.of(context).start_new_test,
                        style: TextStyle(fontSize: 20.0)),
                    color: themeData.accentColor,
                    textColor: themeData.textTheme.button.color,
                    onPressed: () {
                      Answers.rollback();
                      Navigator.popUntil(context, (route) => route.isFirst);
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (context) => StartTestButton()),
//                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0))))
          ])),
    );
  }
}
