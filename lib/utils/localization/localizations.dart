import 'dart:async';

import 'package:flutter/material.dart';
import 'package:helpus/utils/l18n/messages_all.dart';
import 'package:intl/intl.dart';


class AppLocalizations {
  static String currentLangageCode;
  static Future<AppLocalizations> load(Locale locale) {
    final String name = locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get title {
    return Intl.message('Help Us', name: 'title', desc: ' ');
  }  
    String get mydonation {
    return Intl.message('1. My donation', name: 'mydonation', desc: ' ');
  }
    String get oneHourBoat {
    return Intl.message('1 hour boat trip for a lifeboat', name: 'oneHourBoat', desc: ' ');
  }
    String get twoJacket {
    return Intl.message('2 life jackets for a mother and her childp', name: 'twoJacket', desc: ' ');
  }
    String get oneDayyOfSupport {
    return Intl.message('1 day of support on board', name: 'oneDayyOfSupport', desc: ' ');
  }
    String get resecureKit {
    return Intl.message('Rescue kit: Zodiac, life jackets and welcome', name: 'resecureKit', desc: ' ');
  }

    String get theseequivalance {
    return Intl.message('These equivalences are given for information only. My donation can be allocated to all the activities of SOS.', name: 'theseequivalance', desc: ' ');
  }
    String get mycontact {
    return Intl.message('2. My contact details', name: 'mycontact', desc: ' ');
  }
    String get emailAdresse {
    return Intl.message('E-mail Adress', name: 'emailAdresse', desc: ' ');
  }
    String get firsrName {
    return Intl.message('First Name', name: 'firsrName', desc: ' ');
  }   String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: ' ');
  } String get toValidate {
    return Intl.message('To Validate', name: 'toValidate', desc: ' ');
  }
   String get therteen {
    return Intl.message('30', name: 'therteen', desc: ' ');
  }   String get fifteen {
    return Intl.message('50', name: 'fifteen', desc: ' ');
  }  String get oneHundred {
    return Intl.message('100', name: 'oneHundred', desc: ' ');
  }
 String get oneHundredtwentyfour {
    return Intl.message('180', name: 'oneHundredtwentyfour', desc: ' ');
  } String get next {
    return Intl.message('next', name: 'next', desc: ' ');
  }

  









  String get hello {
    return Intl.message('Hello', name: 'hello');
  }

  

  String get error_connecting_alert {
    return Intl.message('Error Connecting , please try again !  ', name: 'error_connecting_alert');
  }

  String get error_network_alert {
    return Intl.message('Error Connecting  , please check your connection and try again ', name: 'error_network_alert');
  }

  String get confirm_leave_dialog {
    return Intl.message('Are you sure you want to leave ?', name: 'confirm_leave_dialog');
  }

  String get yes_exit_label {
    return Intl.message('Yes, exit', name: 'yes_exit_label');
  }

  String get no_exit_label {
    return Intl.message('No', name: 'no_exit_label');
  }

 

  String get home_label {
    return Intl.message('Home', name: 'home_label');
  }

  String get profile_label {
    return Intl.message('Profile', name: 'profile_label');
  }

  String get confirm_exit_dialog {
    return Intl.message('Are you sure you want to exit ?', name: 'confirm_exit_dialog');
  }

  String get confirm_exit_app_dialog {
    return Intl.message('Are you sure you want to exit the application ?', name: 'confirm_exit_app_dialog');
  }




}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return true;
    // return ['en', 'fr', 'aus', 'es', 'ar', 'us'].contains(['en', 'fr', 'aus', 'es', 'ar', 'us']);
    // return ['en', 'fr','aus', 'es','ar','us'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return true;
  }
}
