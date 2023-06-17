part of 'app_settings_bloc.dart';

abstract class AppSettingsEvent extends Equatable {
  const AppSettingsEvent();

  @override
  List<Object> get props => [];
}

class SelectLanguage extends AppSettingsEvent {
  final Languages? language;
  final Locale? locale;

  const SelectLanguage({this.locale, this.language});

  @override
  List<Object> get props => [language!, locale!];
}

class SelectTheme extends AppSettingsEvent {
  final AppTheme? appTheme;

  const SelectTheme({this.appTheme});

  @override
  List<Object> get props => [appTheme!];
}