part of 'onboarding_bloc.dart';

class OnboardingState extends Equatable {
  final int currentIndex;
  final List<OnboardingModel> model;
  final PageController pageController;
  const OnboardingState({this.currentIndex = 0, required this.model, required this.pageController});

  @override
  List<Object> get props => [currentIndex, model, pageController];
}
