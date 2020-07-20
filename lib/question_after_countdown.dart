import 'package:coronavirustester/localizations.dart';
import 'package:coronavirustester/question_fever.dart';
import 'package:coronavirustester/test_results.dart';
import 'package:flutter/material.dart';

class QuestionAfterCountdown extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QuestionAfterCountdownState();
}

class QuestionAfterCountdownState extends State<QuestionAfterCountdown> {
  bool isBreathKept;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context).title_breathing_status),
          centerTitle: true,
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.favorite))
          ]),
      body: Container(
        child: Align(
            alignment: FractionalOffset.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        AppLocalizations.of(context).breathing_question,
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                  Padding(
                    padding: EdgeInsets.all(40),
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                          child: Text(AppLocalizations.of(context).yes, style: TextStyle(fontSize: 20.0)),
                          color: themeData.accentColor,
                          textColor: themeData.textTheme.button.color,
                          onPressed: () {
                            Answers.isBreathKept = true;
                            showNextScreen();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      FlatButton(
                          color: themeData.accentColor,
                          textColor: themeData.textTheme.button.color,
                          child: Text(AppLocalizations.of(context).no, style: TextStyle(fontSize: 20.0)),
                          onPressed: () {
                            Answers.isBreathKept = false;
                            showNextScreen();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)))
                    ],
                  ))
                ])),
      ),
    );
  }

  void showNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionFever()),
    );
  }
}
