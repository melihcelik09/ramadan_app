import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ramadan_app/app/view/home/model/daily_weather/daily_weather_model.dart';
import 'package:ramadan_app/app/view/home/model/daily_weather/weather_language_model.dart';
import 'package:ramadan_app/app/view/location/cubit/location_cubit.dart';
import 'package:ramadan_app/core/constants/app_endpoints.dart';
import 'package:ramadan_app/core/init/network/network_client.dart';

class DailyWeatherService {
  final NetworkClient _client;
  DailyWeatherService()
      : _client = NetworkClient(Dio(), baseUrl: AppEndpoints.weatherBaseUrl);

  Future<DailyWeatherModel> dailyWeather(BuildContext context) async {
    var location = context.read<LocationCubit>().fetchUserLocation();
    String key = dotenv.env['X_RAPID_API_KEY'] ?? "";
    try {
      final response = await _client.getDailyWeather(
          key, "${location.latitude},${location.longitude}");
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<WeatherLanguage>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/conditions.json');
    final data = json.decode(response);
    List<WeatherLanguage> list = List<WeatherLanguage>.from(
        data.map((x) => WeatherLanguage.fromJson(x)));
    return list;
  }
}
