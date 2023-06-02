part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class SplashNavigateOnboarding extends SplashState {}

class SplashNavigateLocation extends SplashState {}

class SplashNavigateHome extends SplashState {}
