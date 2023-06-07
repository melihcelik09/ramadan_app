import 'package:dio/dio.dart';
import 'package:ramadan_app/app/view/home/model/daily_dua/daily_dua_model.dart';

import 'package:ramadan_app/app/view/home/model/daily_weather/daily_weather_model.dart';
import 'package:ramadan_app/app/view/location/model/location_model.dart';
import 'package:ramadan_app/app/view/asma_al_husna/model/asma_al_husna.dart';
import 'package:ramadan_app/app/view/location/model/user_location_model.dart';
import 'package:ramadan_app/app/view/prayer_time/model/prayer_response_model.dart';
import 'package:ramadan_app/app/view/ramadan_time/model/calendar_model.dart';
import 'package:ramadan_app/core/constants/app_endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'network_client.g.dart';

@RestApi(baseUrl: AppEndpoints.baseUrl)
abstract class NetworkClient {
  factory NetworkClient(Dio dio, {String baseUrl}) = _NetworkClient;

  @GET("/countries")
  Future<List<LocationModel>> getCountries();

  @GET("/regions")
  Future<List<String>> getState(@Query("country") String country);

  @GET("/cities")
  Future<List<String>> getCity(
      @Query("country") String country, @Query("region") String region);

  @GET("/coordinates")
  Future<UserLocationModel> getCoordinate(@Query("country") String country,
      @Query("region") String region, @Query("city") String city);

  @GET("/timesFromCoordinates")
  Future<PrayerResponseModel> getTimesFromCoordinates(
    @Query("lat") String latitude,
    @Query("lng") String longitude,
    @Query("days") String days,
    @Query("timezoneOffset") String timezone,
  );

  //baseUrl= https://api.alquran.cloud/v1
  //Please specify an Ayah number (1 to 6236).
  @GET("/ayah/{number}/editions/tr.diyanet,en.asad")
  Future<DailyDuaModel> getAyah(@Path("number") String number);

  //baseUrl= https://api.aladhan.com/v1
  @GET("/gToH/{date}")
  Future getHijriDate(@Path("date") String date);

  //baseUrl= https://api.aladhan.com/v1
  @GET("/qibla/{latitude}/{longitude}")
  Future getQiblaDirection(
      @Path("latitude") String latitude, @Path("longitude") String longitude);

  @GET("/name")
  Future<AsmaAlHusna> getAsmaulHusna(@Header("X-RapidAPI-Key") String key);

  //q= 37.84501,27.83963
  @GET("/current.json")
  Future<DailyWeatherModel> getDailyWeather(
      @Header("X-RapidAPI-Key") String key, @Query("q") String coordinates);

  //baseUrl= https://api.aladhan.com/v1
  @GET("/hToG/{date}")
  Future<CalendarModel> requestGregorianforHijri(
      @Header("X-RapidAPI-Key") String key, @Path("date") String date);
}
