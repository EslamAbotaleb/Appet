import 'dart:io';

import 'package:appet/helpers/preferences_manager.dart';
import 'package:flutter/material.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = Locale(Platform.localeName.split("_").first);

  Locale get appLocal => _appLocale;

  fetchLocale() async {
    String? langCode = PreferencesManager.getLang();
    if (langCode == null) {
      _appLocale = Locale(Platform.localeName.split("_").first);
    } else {
      _appLocale = Locale(langCode);
    }
    print(" app lang code   ${_appLocale.languageCode}");
  }

  void changeLanguage(Locale locale) async {
    if (_appLocale == locale) {
      return;
    }
    PreferencesManager.setLang(locale.languageCode);

    _appLocale = locale;

    print("changin the app language to: ${_appLocale.languageCode}");

    notifyListeners();
  }
}
