part of 'app_settings_bloc.dart';

enum Languages { turkce, english }

class AppSettingsState extends Equatable {
  const AppSettingsState({required this.language, required this.languages});
  final Languages language;
  final List<Languages> languages;

  AppSettingsState copyWith({Languages? language, List<Languages>? languages}) {
    return AppSettingsState(
      language: language ?? this.language,
      languages: languages ?? this.languages,
    );
  }

  @override
  List<Object> get props => [language, languages];
}
