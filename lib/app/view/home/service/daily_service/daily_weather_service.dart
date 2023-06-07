import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/home/model/daily_weather/daily_weather_model.dart';
import 'package:ramadan_app/app/view/location/cubit/location_cubit.dart';
import 'package:ramadan_app/core/constants/app_endpoints.dart';
import 'package:ramadan_app/core/init/network/network_client.dart';

class DailyWeatherService {
  final NetworkClient _client;
  final String baseUrl;
  DailyWeatherService({required this.baseUrl})
      : _client = NetworkClient(Dio(), baseUrl: AppEndpoints.weatherBaseUrl);

  Future<DailyWeatherModel> dailyWeather(BuildContext context) async {
    var location = context.read<LocationCubit>().fetchUserLocation();
    try {
      final response = await _client.getDailyWeather(
          '77bd26fb72mshd52097b4eaa3e06p1a44b8jsn68fc3dc01507',
          "${location.latitude},${location.longitude}");
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
