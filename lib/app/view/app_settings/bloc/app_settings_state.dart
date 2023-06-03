part of 'app_settings_bloc.dart';

enum Languages { turkce, english }

enum Themes { system, light, dark }

class AppSettingsState extends Equatable {
  const AppSettingsState({
    required this.language,
    required this.theme,
  });

  final Languages language;
  final Themes theme;

  AppSettingsState copyWith({
    Languages? language,
    Themes? theme,
  }) {
    return AppSettingsState(
      language: language ?? this.language,
      theme: theme ?? this.theme,
    );
  }

  @override
  List<Object> get props => [language, theme];
}
