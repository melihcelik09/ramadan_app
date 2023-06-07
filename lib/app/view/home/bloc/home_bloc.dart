import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/home/model/daily_weather/daily_weather_model.dart';
import 'package:ramadan_app/app/view/home/service/daily_service/daily_weather_service.dart';
import 'package:ramadan_app/core/constants/app_endpoints.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>(_fetchEvent as EventHandler<HomeEvent, HomeState>);
  }

  FutureOr<void> _fetchEvent(BuildContext context, event, emit) async {
    emit(HomeLoading());
    if (event is HomeFetchEvent) {
      try {
        var dailyWeather =
            await DailyWeatherService(baseUrl: AppEndpoints.weatherBaseUrl)
                .dailyWeather(context);
        emit(HomeLoaded(model: dailyWeather));
      } catch (e) {
        emit(HomeError(message: e.toString()));
      }
    }
  }
}
