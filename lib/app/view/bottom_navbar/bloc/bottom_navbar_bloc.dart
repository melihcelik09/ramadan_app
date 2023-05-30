import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/home/view/home_view.dart';
import 'package:ramadan_app/app/view/prayer_time/view/prayer_time_view.dart';

part 'bottom_navbar_event.dart';
part 'bottom_navbar_state.dart';

class BottomNavbarBloc extends Bloc<BottomNavbarEvent, BottomNavbarInitial> {
  BottomNavbarBloc()
      : super(const BottomNavbarInitial(
          pages: [
            HomeView(),
            PrayerTimeView(),
          ],
        )) {
    on<BottomNavbarInitialEvent>((event, emit) {
      emit(state.copyWith(currentPage: 0));
    });
    on<BottomNavbarEventChange>((event, emit) {
      emit(state.copyWith(currentPage: event.index));
    });
  }
}
