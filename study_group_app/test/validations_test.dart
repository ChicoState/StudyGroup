import 'package:flutter_test/flutter_test.dart';
import 'package:study_group_app/utilities/validations.dart';

void main() {
  group('Input validation', () {
    // Email verification
    test('Email validation should return null, meaning success', () {
      String validEmail = 'email@gmail.com';
      expect(Validations.instance.emailValidation(validEmail), null);
    });

    test('Email validation should return error message', () {
      String invalidEmail = '@@notemail';
      expect(Validations.instance.emailValidation(invalidEmail),
          "Enter a valid email address");
    });
    // Password verification
    test('Password validation should return null, meaning success', () {
      String validPassword = 'validPassword009';
      expect(Validations.instance.password(validPassword), null);
    });
    test('Password verifcation should return error message', () {
      String invalidPassword = '@@'; // Too short and uses special chars
      expect(Validations.instance.password(invalidPassword),
          "Please enter a password between 6 and 20 characters");
    });
    // User name verifcation
    test('User name should return null, meaning success', () {
      String validUsername = 'valid_userName';
      expect(Validations.instance.userNameValidation(validUsername), null);
    });
    test('User name should return error message', () {
      String invalidUsername = '_invalid'; // Can't start with underscore
      expect(Validations.instance.userNameValidation(invalidUsername),
          "Enter a valid username (4-16 chars _ or .)");
    });
  });
}
