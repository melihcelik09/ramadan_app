part of 'app_settings_bloc.dart';

abstract class AppSettingsEvent extends Equatable {
  const AppSettingsEvent();

  @override
  List<Object> get props => [];
}

class SelectLanguage extends AppSettingsEvent {
  final Languages? language;

  const SelectLanguage({this.language});

  @override
  List<Object> get props => [language!];
}

class SelectTheme extends AppSettingsEvent {
  final Themes? theme;

  const SelectTheme({this.theme});

  @override
  List<Object> get props => [theme!];
}
