part of 'app_settings_bloc.dart';

enum Languages { turkce, english }


class AppSettingsState extends Equatable {
  const AppSettingsState({
    required this.locale,
    required this.language,
    required this.theme,
    required this.themeData,
  });

  final Languages language;
  final AppTheme theme;
  final Locale locale;
  final ThemeData themeData;

  AppSettingsState copyWith({
    Locale? locale,
    Languages? language,
    AppTheme? theme,
    ThemeData? themeData,
  }) {
    return AppSettingsState(
        locale: locale ?? this.locale,
        language: language ?? this.language,
        theme: theme ?? this.theme,
        themeData: themeData ?? this.themeData);
  }

  @override
  List<Object> get props => [language, theme, locale, themeData];
}
