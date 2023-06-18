import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/app_settings/bloc/app_settings_bloc.dart';
import 'package:ramadan_app/core/init/cache/cache_manager.dart';
import 'package:ramadan_app/core/init/theme/theme.dart';

List<dynamic> get selectedTheme {
  List<dynamic> selectedTheme = [];
  ThemeData themeData;
  int initialTheme = CacheManager<Map<String, dynamic>>()
          .readData(key: CacheManagerEnum.theme.name)?["theme"] ??
      2;

  switch (initialTheme) {
    case 0:
      themeData = CustomTheme.appThemeData[AppTheme.lightTheme]!;
      selectedTheme.addAll([themeData, AppTheme.lightTheme]);
      return selectedTheme;
    case 1:
      themeData = CustomTheme.appThemeData[AppTheme.darkTheme]!;
      selectedTheme.addAll([themeData, AppTheme.darkTheme]);
      return selectedTheme;
    default:
      themeData =
          WidgetsBinding.instance.window.platformBrightness == Brightness.dark
              ? CustomTheme.appThemeData[AppTheme.darkTheme]!
              : CustomTheme.appThemeData[AppTheme.lightTheme]!;
      selectedTheme.addAll([themeData, AppTheme.systemTheme]);
      return selectedTheme;
  }
}

List<dynamic> get selectedLanguage {
  List<dynamic> selectedLanguage = [];
  Locale locale;
  int initialLangauge = CacheManager<Map<String, dynamic>>()
              .readData(key: CacheManagerEnum.language.name)?["language"] ??
          Platform.localeName == "tr_TR"
      ? 0
      : 1;

  switch (initialLangauge) {
    case 0:
      locale = const Locale("tr", "TR");
      selectedLanguage.addAll([locale, Languages.turkce]);
      return selectedLanguage;
    default:
      locale = const Locale("en", "EN");
      selectedLanguage.addAll([locale, Languages.english]);
      return selectedLanguage;
  }
}
