import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'app_settings_event.dart';
part 'app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  AppSettingsBloc()
      : super(
          const AppSettingsState(
            language: Languages.turkce,
            locale: Locale("tr", "TR"),
            theme: Themes.light,
          ),
        ) {
    on<SelectLanguage>((event, emit) {
      emit(state.copyWith(locale: event.locale));
      emit(state.copyWith(language: event.language));
    });
    on<SelectTheme>((event, emit) {
      emit(state.copyWith(theme: event.theme));
    });
  }
}
