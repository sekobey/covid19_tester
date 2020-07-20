// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "breathing_info" : MessageLookupByLibrary.simpleMessage("Keep your breath for 10 seconds. Press \'Start\' when you are ready."),
    "breathing_info2" : MessageLookupByLibrary.simpleMessage("* In this test, we want to learn your breathing status. Therefore, we want you to keep your breath for 10 seconds. if you are coughing before 10 seconds end, then there may be a problem."),
    "breathing_question" : MessageLookupByLibrary.simpleMessage("Were you able to keep your breath without coughing?"),
    "country" : MessageLookupByLibrary.simpleMessage("* Country"),
    "description_application" : MessageLookupByLibrary.simpleMessage("* This application is used to test whether person has COVID-19 according to the answers. Therefore, it does not give exact result. Questions are based on the mostly seen symptomps among COVID-19 patients."),
    "female" : MessageLookupByLibrary.simpleMessage("Female"),
    "fever_info" : MessageLookupByLibrary.simpleMessage("Please measure your fever and enter it to the below field."),
    "fever_info2" : MessageLookupByLibrary.simpleMessage("* One of the most important symptom for COVID-19 is high fever. The Most of the patients has high fever according to the statistics."),
    "gender" : MessageLookupByLibrary.simpleMessage("* Gender"),
    "general_chronic" : MessageLookupByLibrary.simpleMessage("I have chronic disease"),
    "general_coughing" : MessageLookupByLibrary.simpleMessage("I am coughing"),
    "general_tired" : MessageLookupByLibrary.simpleMessage("I am feeling tired"),
    "info_betterGoHospital" : MessageLookupByLibrary.simpleMessage("Please do not worry but it is better to go to a hospital to be sure about your situation."),
    "info_emergency" : MessageLookupByLibrary.simpleMessage("According to your answers, your situation is a bit critic. You have to go to emergency to be sure about your situation."),
    "info_noWorries" : MessageLookupByLibrary.simpleMessage("You seems OK according to your answers. You do not need to worry. Please stay at home."),
    "info_shouldGoHospital" : MessageLookupByLibrary.simpleMessage("You should go to an hospital because your symptoms are a bit high than expected."),
    "info_takeCare" : MessageLookupByLibrary.simpleMessage("You should take care of yourself and stay at home. Take additional vitamins to strengthen your immune system."),
    "male" : MessageLookupByLibrary.simpleMessage("Male"),
    "next" : MessageLookupByLibrary.simpleMessage("Next"),
    "no" : MessageLookupByLibrary.simpleMessage("No"),
    "select_country" : MessageLookupByLibrary.simpleMessage("Select a country"),
    "select_gender" : MessageLookupByLibrary.simpleMessage("Select a gender"),
    "start" : MessageLookupByLibrary.simpleMessage("Start"),
    "start_new_test" : MessageLookupByLibrary.simpleMessage("Start A New Test"),
    "start_test" : MessageLookupByLibrary.simpleMessage("Start\nTest"),
    "title_betterGoHospital" : MessageLookupByLibrary.simpleMessage("Better to Go Hospital"),
    "title_breathing_status" : MessageLookupByLibrary.simpleMessage("Breathing Status"),
    "title_covid19_tester" : MessageLookupByLibrary.simpleMessage("COVID-19 Tester"),
    "title_emergency" : MessageLookupByLibrary.simpleMessage("Emergency"),
    "title_fever" : MessageLookupByLibrary.simpleMessage("Fever Measure"),
    "title_general_situation" : MessageLookupByLibrary.simpleMessage("General Situation"),
    "title_noWorries" : MessageLookupByLibrary.simpleMessage("Stay at Home"),
    "title_personal_information" : MessageLookupByLibrary.simpleMessage("Personal Information"),
    "title_shouldGoHospital" : MessageLookupByLibrary.simpleMessage("Go Hospital"),
    "title_takeCare" : MessageLookupByLibrary.simpleMessage("Take Care"),
    "title_test_result" : MessageLookupByLibrary.simpleMessage("Test Result"),
    "warning_empty_year_of_birth" : MessageLookupByLibrary.simpleMessage("Please enter your year of birth"),
    "warning_valid_year" : MessageLookupByLibrary.simpleMessage("Please enter a valid year"),
    "warning_year_smallerthan_current" : MessageLookupByLibrary.simpleMessage("Year of birth has to be smaller than current year"),
    "year_of_birth" : MessageLookupByLibrary.simpleMessage("* Year of Birth"),
    "yes" : MessageLookupByLibrary.simpleMessage("Yes")
  };
}
