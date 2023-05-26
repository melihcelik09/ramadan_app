import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/onboarding/model/onboarding_model.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc()
      : super(OnboardingState(
            model: model, currentIndex: 0, pageController: PageController())) {
    on<ChangePageEvent>((event, emit) {
      state.pageController.animateToPage(event.index,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
      emit(OnboardingState(
          model: model,
          currentIndex: event.index,
          pageController: state.pageController));
    });
  }
}

List<OnboardingModel> model = [
  OnboardingModel(
    image: 'assets/images/onboarding/1.svg',
    title: 'Welcome to Ramadan App!',
    description: 'This app is designed to make worship easier for you.',
  ),
  OnboardingModel(
    image: 'assets/images/onboarding/2.svg',
    title: 'Prayer Times',
    description:
        'This app provides you with prayer times based on your location.',
  ),
  OnboardingModel(
    image: 'assets/images/onboarding/3.svg',
    title: 'Daily Dua',
    description: 'We present you with verses from the Quran every day',
  ),
];
