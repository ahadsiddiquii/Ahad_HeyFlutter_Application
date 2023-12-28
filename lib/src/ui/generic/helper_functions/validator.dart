import 'package:flutter/services.dart';

class FieldValidator {
  FieldValidator._();

  static String emptyEmailValidationText = 'Please enter your email';
  static String incompleteEmailValidationText = 'Please enter a valid email';
  static String emptyPasswordValidationText = 'Please enter your password';
  static String incompletePasswordValidationText =
      'Please enter a valid password';

  static RegExp passwordRegExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{8,}$');

  //Email
  static List<TextInputFormatter> emailInputFormatter() {
    return [
      FilteringTextInputFormatter.deny(RegExp(r'\s')),
      LengthLimitingTextInputFormatter(50),
    ];
  }

  static String? emailFieldValidator(
    String val,
  ) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(val);
    if (val.isEmpty) {
      return emptyEmailValidationText;
    }

    if (!emailValid) {
      return incompleteEmailValidationText;
    }

    return null;
  }

  //Password Login
  static String? passwordFieldSigninValidator(
      String val, String correctPassword) {
    if (val.isEmpty) {
      return emptyPasswordValidationText;
    }
    if (val != correctPassword) {
      return 'Incorrect password';
    }

    return null;
  }

  //Password Register
  static String? passwordFieldSignUpValidator(String val) {
    final bool passwordValid = passwordRegExp.hasMatch(val);
    if (val.isEmpty) {
      return emptyPasswordValidationText;
    }

    if (!passwordValid) {
      return incompletePasswordValidationText;
    }

    return null;
  }

  //Password Re-enter
  static String? passwordFieldSignUpReEnterValidator(
    String val,
    String oldPassword,
  ) {
    final bool passwordValid = passwordRegExp.hasMatch(val);
    if (val.isEmpty) {
      return emptyPasswordValidationText;
    }

    if (val != oldPassword) {
      return 'Passwords does not match';
    }

    if (!passwordValid) {
      return incompletePasswordValidationText;
    }

    return null;
  }

  //password conditional validator

  static String? passwordFieldConditionalValidator(String val) {
    if (val.isEmpty) {
      return null;
    }
    final bool passwordValid = passwordRegExp.hasMatch(val);

    if (!passwordValid) {
      return incompletePasswordValidationText;
      // return TranslationBlocHelper.getLocalizedText(
      //     OnboardingScreensText.PLEASEENTERAVALIDPASSWORD);
    }

    return null;
  }

  static String? genericTextValidator(String val, String errorMessage) {
    if (val.isEmpty) {
      return errorMessage;
    }

    return null;
  }

  // FIRST NAME AND LAST NAME
  static List<LengthLimitingTextInputFormatter> nameInputFormatter() {
    return [LengthLimitingTextInputFormatter(25)];
  }

  //Zip
  static List<LengthLimitingTextInputFormatter> zipInputFormatter() {
    return [LengthLimitingTextInputFormatter(11)];
  }

  //State
  static List<LengthLimitingTextInputFormatter> stateInputFormatter() {
    return [LengthLimitingTextInputFormatter(2)];
  }

  static String? fullNameValidator(String val) {
    if (val.isEmpty) {
      return 'Please enter your name';
    }

    return null;
  }

  static String? firstNameValidator(String val) {
    if (val.isEmpty) {
      return 'Please enter your first name';
    }

    return null;
  }

  static String? lastNameValidator(String val) {
    if (val.isEmpty) {
      return 'Please enter your last name';
    }

    return null;
  }

  //Text limiter

  static String getLimitedText(
    String text,
    int maxLength,
  ) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength - 1)}...';
    }
  }
}
