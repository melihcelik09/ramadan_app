import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc()
      : super(OnboardingState(
            currentIndex: 0, pageController: PageController())) {
    on<ChangePageEvent>((event, emit) {
      state.pageController.animateToPage(event.index,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
      emit(OnboardingState(
          currentIndex: event.index, pageController: state.pageController));
    });
  }
}
