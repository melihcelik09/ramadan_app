import 'package:flutter/material.dart';
import 'package:ramadan_app/core/init/theme/custom_text_theme.dart';

class CustomTheme {
  CustomTheme._();
  static ThemeData theme() {
    return ThemeData(textTheme: CustomTextTheme.textTheme);
  }
}
