part of 'onboarding_bloc.dart';

@immutable
abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class ChangePageEvent extends OnboardingEvent {
  final int index;
  const ChangePageEvent({this.index = 0});

  @override
  List<Object> get props => [index];
}
