import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'localization/language_constants.dart';
import 'localization/localizations.dart';

class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  static isValidConfirmPassword(String confirmPassword) {
    return _passwordRegExp.hasMatch(confirmPassword);
  }

  static tryToInteger(num value) {
    bool isInteger = value is int || value == value.roundToDouble();
    if (isInteger)
      return value.toStringAsFixed(0);
    else
      return value.toStringAsFixed(2);
  }
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

String convertDateFromStringIso8601(String stringOfdate) {
  DateTime d = DateTime.parse(stringOfdate);

  switch (AppLocalizations.currentLangageCode) {
    case ENGLISH:
      return "${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}-${d.year}";
      break;

    case FRANCE:
      return "${d.day.toString().padLeft(2, '0')}-${d.month.toString().padLeft(2, '0')}-${d.year}";
      break;

    case SPANISH:
      return "${d.day.toString().padLeft(2, '0')}-${d.month.toString().padLeft(2, '0')}-${d.year}";
      break;

    default:
      return "${d.day.toString().padLeft(2, '0')}-${d.month.toString().padLeft(2, '0')}-${d.year}";
  }
}





//here goes the function

