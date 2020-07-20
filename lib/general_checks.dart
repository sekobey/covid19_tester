import 'package:coronavirustester/localizations.dart';
import 'package:coronavirustester/data.dart';
import 'package:coronavirustester/style.dart';
import 'package:coronavirustester/test_results.dart';
import 'package:flutter/material.dart';

import 'circle_countdown_timer_widget.dart';

class StartTestButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).title_covid19_tester),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 2,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GeneralInfo(), settings: RouteSettings(name:"/initial")),
                      );
                    },
                    child: Text(AppLocalizations.of(context).start_test,
                        style: TextStyle(
                            color: themeData.textTheme.button.color,
                            fontSize: 60),
                        textAlign: TextAlign.center),
                    shape: CircleBorder(),
                    color: themeData.accentColor,
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    AppLocalizations.of(context).description_application,
                    textAlign: TextAlign.justify,
                    style: themeData.textTheme.bodyText1
                  ))
            ])));
  }
}

class GeneralInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeneralInfoState();
}

class GeneralInfoState extends State<GeneralInfo> {
  @override
  Widget build(BuildContext context) {
    var appStyle = AppStyle(context);
    var themeData = Theme.of(context);

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context).title_personal_information),
          centerTitle: true,
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 10), child: Icon(Icons.info))
          ]),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  buildYearOfBirth(appStyle, themeData),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: buildGender(appStyle, themeData)),
                  buildCountry(appStyle, themeData),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: FlatButton(
                        child: Text(AppLocalizations.of(context).next, style: TextStyle(fontSize: 20.0)),
                        color: themeData.accentColor,
                        textColor: themeData.textTheme.button.color,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GeneralChecks()),
                            );
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  TextFormField buildYearOfBirth(AppStyle appStyle, ThemeData mainTheme) {
    return TextFormField(
      decoration: appStyle.textFieldDecoration(labelText: AppLocalizations.of(context).year_of_birth),
      style: TextStyle(color: mainTheme.accentColor),
      keyboardType: TextInputType.numberWithOptions(),
      initialValue:
          Answers.birthYear != null ? Answers.birthYear.toString() : "",
      onFieldSubmitted: (value) => Answers.birthYear = int.parse(value),
      onSaved: (value) => Answers.birthYear = int.parse(value),
      validator: (value) {
        if (value.isEmpty) return AppLocalizations.of(context).warning_empty_year_of_birth;
        int year = int.tryParse(value);
        if (year == null)
          return AppLocalizations.of(context).warning_valid_year;
        else if (int.parse(value) > DateTime.now().year)
          return AppLocalizations.of(context).warning_year_smallerthan_current;

        return null;
      },
    );
  }

  DropdownButtonFormField<String> buildGender(
      AppStyle appStyle, ThemeData mainTheme) {
    return DropdownButtonFormField<String>(
      decoration: appStyle.textFieldDecoration(labelText: AppLocalizations.of(context).gender),
//          child: DropdownButtonHideUnderline(
      value: Answers.gender,
      onChanged: (newValue) {
        setState(() {
          Answers.gender = newValue;
        });
      },
      validator: (value) => (value == null) ? AppLocalizations.of(context).select_gender : null,
      items: [AppLocalizations.of(context).male, AppLocalizations.of(context).female].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: mainTheme.accentColor),
          ),
        );
      }).toList(),
//          ),
    );
  }

  DropdownButtonFormField<String> buildCountry(
      AppStyle appStyle, ThemeData mainTheme) {
    return DropdownButtonFormField<String>(
      decoration: appStyle.textFieldDecoration(labelText: AppLocalizations.of(context).country),
      style: TextStyle(color: Colors.white),
      value: Answers.country,
      elevation: 8,
      onChanged: (newValue) {
        setState(() {
          Answers.country = newValue;
        });
      },
      validator: (value) => value == null ? AppLocalizations.of(context).select_country : null,
      items: allCountries.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: mainTheme.accentColor),
          ),
        );
      }).toList(),
    );
  }
}

class GeneralChecks extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeneralChecksState();
}

class GeneralChecksState extends State<GeneralChecks> {
  var coughing = false;
  var tired = false;
  var chronic = false;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).title_general_situation),
          centerTitle: true,
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.local_hospital))
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(50),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                          activeColor: themeData.accentColor,
                          value: tired,
                          onChanged: (bool newVal) {
                            setState(() {
                              tired = newVal;
                              Answers.tired = tired;
                            });
                          }),
                      Text(
                        AppLocalizations.of(context).general_tired,
                        style: themeData.textTheme.bodyText2,
//                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                              value: coughing,
                              onChanged: (bool newVal) {
                                setState(() {
                                  coughing = newVal;
                                  Answers.coughing = coughing;
                                });
                              }),
                          Text(AppLocalizations.of(context).general_coughing,
                              style: themeData.textTheme.bodyText2)
                        ],
                      ),
                    )),
                Container(
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                          value: chronic,
                          onChanged: (bool newVal) {
                            setState(() {
                              chronic = newVal;
                              Answers.chronic = chronic;
                            });
                          }),
                      Text(AppLocalizations.of(context).general_chronic,
                          style: themeData.textTheme.bodyText2)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: FlatButton(
                      child: Text(AppLocalizations.of(context).next, style: TextStyle(fontSize: 20.0)),
                      color: themeData.accentColor,
                      textColor: themeData.textTheme.button.color,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountDownTimer()),
                        );
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )
              ],
            ))));
  }
}
