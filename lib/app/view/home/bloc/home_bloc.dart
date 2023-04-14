import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ramadan_app/app/view/home/model/daily_weather/daily_weather_model.dart';
import 'package:ramadan_app/app/view/home/service/home_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>(_fetchEvent);
  }

  FutureOr<void> _fetchEvent(event, emit) async {
    emit(HomeLoading());
    if (event is HomeFetchEvent) {
      try {
        var dailyWeather = await HomeService.instance.getDailyWeather();
        emit(HomeLoaded(model: dailyWeather));
      } catch (e) {
        emit(HomeError(message: e.toString()));
      }
    }
  }
}
