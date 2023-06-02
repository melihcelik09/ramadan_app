import 'package:dio/dio.dart';
import 'package:ramadan_app/app/view/prayer_time/model/prayer_response_model.dart';
import 'package:ramadan_app/core/init/network/network_client.dart';

class PrayerTimeService {
  final NetworkClient _client;
  final String baseUrl;
  PrayerTimeService({required this.baseUrl}) : _client = NetworkClient(Dio(), baseUrl: baseUrl);

  Future<PrayerResponseModel> getTimesFromCoordinates({
    required String latitude,
    required String longitude,
    int? days = 7,
    int? timezone = 180,
  }) async {
    try {
      var response = await _client.getTimesFromCoordinates(latitude, longitude, days.toString(), timezone.toString());
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
