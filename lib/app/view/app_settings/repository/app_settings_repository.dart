import 'package:flutter/material.dart';
import 'package:ramadan_app/core/init/cache/cache_manager.dart';
import 'package:ramadan_app/core/init/theme/theme.dart';

List<dynamic> get selectedTheme {
  List<dynamic> selectedTheme = [];
  ThemeData themeData;
  int initialTheme = CacheManager<Map<String, dynamic>>()
      .readData(key: CacheManagerEnum.theme.name)!["theme"];

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
