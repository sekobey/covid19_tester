import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

class AppLocalizations {

  static Future<AppLocalizations> load(Locale locale) {
    print('Locale: $locale');
    print('Language Code: ${locale.languageCode}');
    final String name =
    locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get title_covid19_tester {
    return Intl.message('COVID-19 Tester', name: 'title_covid19_tester');
  }

  String get description_application {
    return Intl.message('* This application is used to test whether person has COVID-19 according to the answers. Therefore, it does not give exact result. Questions are based on the mostly seen symptomps among COVID-19 patients.', name: 'description_application');
  }

  String get title_personal_information {
    return Intl.message('Personal Information', name: 'title_personal_information');
  }

  String get next {
    return Intl.message('Next', name: 'next');
  }

  String get year_of_birth {
    return Intl.message('* Year of Birth', name: 'year_of_birth');
  }

  String get warning_empty_year_of_birth {
    return Intl.message('Please enter your year of birth', name: 'warning_empty_year_of_birth');
  }

  String get warning_valid_year {
    return Intl.message('Please enter a valid year', name: 'warning_valid_year');
  }

  String get warning_year_smallerthan_current {
    return Intl.message('Year of birth has to be smaller than current year', name: 'warning_year_smallerthan_current');
  }

  String get gender {
    return Intl.message('* Gender', name: 'gender');
  }

  String get select_gender {
    return Intl.message('Select a gender', name: 'select_gender');
  }

  String get male {
    return Intl.message('Male', name: 'male');
  }

  String get female {
    return Intl.message('Female', name: 'female');
  }

  String get country {
    return Intl.message('* Country', name: 'country');
  }

  String get select_country {
    return Intl.message('Select a country', name: 'select_country');
  }

  String get title_general_situation => Intl.message('General Situation', name: 'title_general_situation');

  String get general_tired => Intl.message('I am feeling tired', name: 'general_tired');

  String get general_coughing => Intl.message('I am coughing', name: 'general_coughing');

  String get general_chronic => Intl.message('I have chronic disease', name: 'general_chronic');

  String get title_breathing_status => Intl.message('Breathing Status', name: 'title_breathing_status');

  String get breathing_info => Intl.message('''Keep your breath for 10 seconds. Press 'Start' when you are ready.''', name: 'breathing_info');

  String get breathing_info2 => Intl.message('''* In this test, we want to learn your breathing status. Therefore, we want you to keep your breath for 10 seconds. if you are coughing before 10 seconds end, then there may be a problem.''', name: 'breathing_info2');

  String get start => Intl.message('Start', name: 'start');

  String get breathing_question => Intl.message('Were you able to keep your breath without coughing?', name: 'breathing_question');

  String get yes => Intl.message('Yes', name: 'yes');

  String get no => Intl.message('No', name: 'no');

  String get title_fever => Intl.message('Fever Measure', name: 'title_fever');

  String get fever_info => Intl.message('Please measure your fever and enter it to the below field.', name: 'fever_info');

  String get fever_info2 => Intl.message('* One of the most important symptom for COVID-19 is high fever. The Most of the patients has high fever according to the statistics.', name: 'fever_info2');

  String get title_noWorries => Intl.message('Stay at Home', name: 'title_noWorries');

  String get title_takeCare => Intl.message('Take Care', name: 'title_takeCare');

  String get title_betterGoHospital => Intl.message('Better to Go Hospital', name: 'title_betterGoHospital');

  String get title_shouldGoHospital => Intl.message('Go Hospital', name: 'title_shouldGoHospital');

  String get title_emergency => Intl.message('Emergency', name: 'title_emergency');

  String get info_noWorries => Intl.message('You seems OK according to your answers. You do not need to worry. Please stay at home.', name: 'info_noWorries');

  String get info_takeCare => Intl.message('You should take care of yourself and stay at home. Take additional vitamins to strengthen your immune system.', name: 'info_takeCare');

  String get info_betterGoHospital => Intl.message('Please do not worry but it is better to go to a hospital to be sure about your situation.', name: 'info_betterGoHospital');

  String get info_shouldGoHospital => Intl.message('You should go to an hospital because your symptoms are a bit high than expected.', name: 'info_shouldGoHospital');

  String get info_emergency => Intl.message('According to your answers, your situation is a bit critic. You have to go to emergency to be sure about your situation.', name: 'info_emergency');

  String get start_new_test => Intl.message('Start A New Test', name: 'start_new_test');

  String get start_test => Intl.message('Start\nTest', name: 'start_test');

  String get title_test_result => Intl.message('Test Result', name: 'title_test_result');
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'tr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}