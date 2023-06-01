import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ramadan_app/app/view/splash/repository/splash_repository.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SplashRepository _repository = SplashRepository();
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>((event, emit) {
      if (event is SplashInitialEvent) {
        if (_repository.isOnboardingDone()) {
          if (_repository.isLocationSelected()) {
            emit(SplashNavigateHome());
          } else {
            emit(SplashNavigateLocation());
          }
        } else {
          emit(SplashNavigateOnboarding());
        }
      }
    });
  }
}
