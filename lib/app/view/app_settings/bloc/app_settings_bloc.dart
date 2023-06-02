import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_settings_event.dart';
part 'app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  AppSettingsBloc()
      : super(
          const AppSettingsState(
            languages: [
              Languages.turkce,
              Languages.english,
            ],
            language: Languages.turkce,
          ),
        ) {
    on<SelectLanguage>((event, emit) {
      emit(state.copyWith(language: event.language));
    });
  }
}
