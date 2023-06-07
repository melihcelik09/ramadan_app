import 'dart:math';

import 'package:dio/dio.dart';
import 'package:ramadan_app/app/view/home/model/daily_dua/daily_dua_model.dart';
import 'package:ramadan_app/core/init/network/network_client.dart';

class DailyDuaService {
  final Random random = Random();
  final NetworkClient _client;
  final String baseUrl;
  DailyDuaService({required this.baseUrl})
      : _client = NetworkClient(Dio(), baseUrl: baseUrl);

  Future<DailyDuaModel> getDailyDua() async {
    try {
      final response = await _client.getAyah(random.nextInt(6236).toString());
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
