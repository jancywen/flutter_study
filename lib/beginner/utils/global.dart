import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Global {
  static SharedPreferences _prefs;
  static String languageCode;

  static Locale locale;


  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    languageCode = _prefs.getString("currentLanCode");
    locale = languageCode == null ? null : Locale(languageCode);
  }


  static saveLanguageCode(String code) async {
    _prefs.setString('currentLanCode', code);
  }
}