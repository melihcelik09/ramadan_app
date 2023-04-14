import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ramadan_app/app/view/home/model/daily_weather/daily_weather_model.dart';
import 'package:ramadan_app/core/init/network/network_client.dart';

class HomeService {
  static HomeService? _instance;
  HomeService._();
  static HomeService get instance {
    _instance ??= HomeService._();
    return _instance!;
  }

  Future getDailyWeather() async {
    try {
      var response = await NetworkClient(Dio()).getDailyWeather(
        dotenv.env['X_RAPID_API_KEY'] ?? '',
        "37.84501,27.83963",
      );
      DailyWeatherModel result = DailyWeatherModel.fromJson(response);
      return result;
    } catch (e) {
      return e;
    }
  }
}
