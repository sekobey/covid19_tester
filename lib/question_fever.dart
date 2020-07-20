import 'package:coronavirustester/localizations.dart';
import 'package:coronavirustester/style.dart';
import 'package:coronavirustester/test_results.dart';
import 'package:flutter/material.dart';

class QuestionFever extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QuestionFeverState();
}

class QuestionFeverState extends State<QuestionFever> {
  String fever;

  @override
  Widget build(BuildContext context) {
    var appStyle = AppStyle(context);

    var themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).title_fever),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.whatshot)
          )
        ],
      ),
      body: Container(
        child: Align(
            alignment: FractionalOffset.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child:Text(
                              AppLocalizations.of(context).fever_info,
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                          textAlign: TextAlign.justify,
                        )),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 150,
                          height: 80,
                          child: TextField(
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            decoration: appStyle.textFieldDecoration(),
                            style: TextStyle(color: themeData.accentColor, fontSize: 60),
                            onSubmitted: (String text) {
                              Answers.fever = double.parse(text);
                              showNextScreen();
                            },
                          ),
                        ),
                        Text("°C",
                            style: TextStyle(color: themeData.accentColor, fontSize: 60))
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 50),
                      child:Text(
                        AppLocalizations.of(context).fever_info2,
                        textAlign: TextAlign.justify,
                        style: themeData.textTheme.bodyText1
                      ))
                ])),
      ),
    );
  }

  void showNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TestResults()),
    );
  }
}
