import 'package:flutter/material.dart';
/*String getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context).translate(key);
}*/
import 'package:shared_preferences/shared_preferences.dart';
import 'package:helpus/utils/localization/localizations.dart';

const String LAGUAGE_CODE = 'languageCode';
// ['en', 'fr', 'es','ar','au','us']
//languages code
const String ENGLISH = 'en';
const String FRANCE = 'fr';
const String SPANISH = 'es';
const String ARABIC = 'ar';
const String AUSTRALIAN = 'au';
const String AMERICAN = 'us';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  AppLocalizations.currentLangageCode = languageCode;
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "fr";
  AppLocalizations.currentLangageCode = languageCode;
  return _locale(languageCode);
}

Future<String> getLAGUAGE_CODE() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "fr";
  return languageCode;
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return Locale(ENGLISH, 'US');
    case FRANCE:
      return Locale(FRANCE, "FR");
    case SPANISH:
      return Locale(SPANISH, "SP");
    case AMERICAN:
      return Locale(AMERICAN, 'US');
    case AUSTRALIAN:
      return Locale(AUSTRALIAN, "AU");
    case ARABIC:
      return Locale(ARABIC, "TN");
    default:
      return Locale(FRANCE, 'FR');
  }
}
