import 'package:flutter/material.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = Locale('en');

  //default language is Eng - en
  Locale get appLocal => Locale("en");

  fetchLocale() async {
    _appLocale = Locale('en');
  }
}