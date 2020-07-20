
import 'package:coronavirustester/test_results.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('emergency result return', () {
    Answers.tired = false;
    Answers.coughing = false;
    Answers.chronic = false;
    Answers.fever = 37.8;
    Answers.isBreathKept = false;
    Answers.birthYear = 1950;

    expect(Answers.result(), Result.emergency);
  });

  test('emergency result return when the person is young', () {
    Answers.tired = false;
    Answers.coughing = false;
    Answers.chronic = true;
    Answers.fever = 37.0;
    Answers.isBreathKept = false;
    Answers.birthYear = 2000;

    expect(Answers.result(), Result.emergency);
  });

  test('should go hospital result return when the person is old', () {
    Answers.tired = false;
    Answers.coughing = false;
    Answers.chronic = true;
    Answers.fever = 37.0;
    Answers.isBreathKept = false;
    Answers.birthYear = 1950;

    expect(Answers.result(), Result.shouldGoHospital);
  });
}