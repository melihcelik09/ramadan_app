part of 'app_settings_bloc.dart';

enum Languages { turkce, english }

enum Themes { system, light, dark }

class AppSettingsState extends Equatable {
  const AppSettingsState({
    required this.locale,
    required this.language,
    required this.theme,
  });

  final Languages language;
  final Themes theme;
  final Locale locale;

  AppSettingsState copyWith({
    Locale? locale,
    Languages? language,
    Themes? theme,
  }) {
    return AppSettingsState(
      locale: locale ?? this.locale,
      language: language ?? this.language,
      theme: theme ?? this.theme,
    );
  }

  @override
  List<Object> get props => [language, theme, locale];
}
