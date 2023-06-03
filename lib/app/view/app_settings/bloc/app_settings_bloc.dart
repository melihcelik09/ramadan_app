import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_settings_event.dart';
part 'app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  AppSettingsBloc()
      : super(
          const AppSettingsState(
            language: Languages.turkce,
            theme: Themes.light,
          ),
        ) {
    on<SelectLanguage>((event, emit) {
      emit(state.copyWith(language: event.language));
    });
    on<SelectTheme>((event, emit) {
      emit(state.copyWith(theme: event.theme));
    });
  }
}
