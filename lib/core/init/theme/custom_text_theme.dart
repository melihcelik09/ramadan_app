import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';

class CustomTextTheme {
  CustomTextTheme._();
  static TextTheme get textTheme => TextTheme(
        displayLarge: _displayLarge,
        displayMedium: _displayMedium,
        displaySmall: _displaySmall,
        headlineMedium: _headlineMedium,
        headlineSmall: _headlineSmall,
        titleLarge: _titleLarge,
        titleMedium: _titleMedium,
        titleSmall: _titleSmall,
        bodyLarge: _bodyLarge,
        bodyMedium: _bodyMedium,
        bodySmall: _bodySmall,
        labelLarge: _labelLarge,
        labelSmall: _labelSmall,
      );

  static TextStyle get _baseHeadline => TextStyle(fontFamily: GoogleFonts.poppins().fontFamily);
  static TextStyle get _displayLarge => _baseHeadline.copyWith(fontSize: 48, fontWeight: FontWeight.bold, color: AppColors.secondaryColor);
  static TextStyle get _displayMedium => _baseHeadline.copyWith(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.secondaryColor);
  static TextStyle get _displaySmall => _baseHeadline.copyWith(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle get _headlineMedium => _baseHeadline.copyWith(fontSize: 20, fontWeight: FontWeight.w500);
  static TextStyle get _headlineSmall => _baseHeadline.copyWith(fontSize: 18, fontWeight: FontWeight.w500);
  static TextStyle get _titleLarge => _baseHeadline.copyWith(fontSize: 16, fontWeight: FontWeight.w500);
  static TextStyle get _titleMedium => _baseHeadline.copyWith(fontSize: 16, fontWeight: FontWeight.w500);
  static TextStyle get _titleSmall => _baseHeadline.copyWith(fontSize: 14, fontWeight: FontWeight.w500);
  static TextStyle get _bodyLarge => _baseHeadline.copyWith(fontSize: 16, fontWeight: FontWeight.w400);
  static TextStyle get _bodyMedium => _baseHeadline.copyWith(fontSize: 14, fontWeight: FontWeight.w400);
  static TextStyle get _bodySmall => _baseHeadline.copyWith(fontSize: 12, fontWeight: FontWeight.w400);
  static TextStyle get _labelLarge => _baseHeadline.copyWith(fontSize: 14, fontWeight: FontWeight.w700);
  static TextStyle get _labelSmall => _baseHeadline.copyWith(fontSize: 10, fontWeight: FontWeight.w400);
}