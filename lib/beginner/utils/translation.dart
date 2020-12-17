import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;


class Translations {
  Translations(Locale locale) {
    this.locale = locale;
    _localizedValues = null;
  }


  Locale locale;
  static Map<dynamic, dynamic> _localizedValues;

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  String text(String key) {
    try {
      String value = _localizedValues[key];
      if(value == null || value.isEmpty) {
        return englishText(key);
      } else {
        return value;
      }
    } catch (e) {
      return englishText(key);
    }
  }
 
  String englishText(String key) {
    if( _localizedValues=null){
      return'** $key not fodun';
    }
    return _localizedValues[key] ?? '** $key not fodun';
  }
 
  static Future<Translations> load(Locale locale) async {
    Translations translations = new Translations(locale);
    String jsonContent = await rootBundle.loadString("lib/beginner/locale/i18n_${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
    return translations;
  }
 
  get currentLanguage => locale.languageCode;
}
 
class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();
 
  @override
  bool isSupported(Locale locale) => applic.supportedLanguages.contains(locale.languageCode);
 
  @override
  Future<Translations> load(Locale locale) => Translations.load(locale);
 
  @override
  bool shouldReload(TranslationsDelegate old) => false;
}
 
class SpecificLocalizationDelegate extends LocalizationsDelegate<Translations> {
  final Locale overriddenLocale;
 
  const SpecificLocalizationDelegate(this.overriddenLocale);
 
  @override
  bool isSupported(Locale locale) => overriddenLocale != null;
 
  @override
  Future<Translations> load(Locale locale) => Translations.load(overriddenLocale);
 
  @override
  bool shouldReload(LocalizationsDelegate<Translations> old) => true;
}
 
typedef void LocaleChangeCallback(Locale locale);
class APPLIC {
  // List of supported languages
  final List<String> supportedLanguages = ['en','zh'];
  // Returns the list of supported Locales
  Iterable<Locale> supportedLocales() => supportedLanguages.map<Locale>((lang) => new Locale(lang, ''));
  // Function to be invoked when changing the working language
  LocaleChangeCallback onLocaleChanged;
  ///
  /// Internals
  ///
  static final APPLIC _applic = new APPLIC._internal();
  factory APPLIC(){
    return _applic;
  }
  APPLIC._internal();
}
APPLIC applic = new APPLIC();
