import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_app/core/init/cache/cache_manager.dart';
import 'package:ramadan_app/core/init/theme/theme.dart';
part 'app_settings_event.dart';
part 'app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  final ThemeData themeData;
  final AppTheme selectedRadioButton;
  AppSettingsBloc({required this.themeData, required this.selectedRadioButton})
      : super(
          AppSettingsState(
            language: Languages.turkce,
            locale: const Locale("tr", "TR"),
            theme: selectedRadioButton,
            themeData: themeData,
          ),
        ) {
    on<SelectLanguage>((event, emit) {
      emit(state.copyWith(locale: event.locale));
      emit(state.copyWith(language: event.language));
    });
    on<SelectTheme>(
      (event, emit) async {
        emit(state.copyWith(theme: event.appTheme));
        emit(
          state.copyWith(
            themeData: event.appTheme != AppTheme.systemTheme
                ? CustomTheme.appThemeData[event.appTheme]
                : WidgetsBinding.instance.window.platformBrightness ==
                        Brightness.dark
                    ? CustomTheme.appThemeData[AppTheme.darkTheme]
                    : CustomTheme.appThemeData[AppTheme.lightTheme],
          ),
        );
        Map<String, int> cache = {
          "theme": event.appTheme!.index,
        };
        await CacheManager<Map<String, int>>()
            .writeData(key: CacheManagerEnum.theme.name, value: cache);
      },
    );
  }
}
