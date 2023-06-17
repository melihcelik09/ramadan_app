import 'dart:math';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:ramadan_app/app/view/home/model/daily_dua/daily_dua_model.dart';
import 'package:ramadan_app/core/init/cache/cache_manager.dart';
import 'package:ramadan_app/core/init/network/network_client.dart';

class DailyDuaService {
  final Random random = Random();
  final NetworkClient _client;
  DailyDuaService({required String baseUrl})
      : _client = NetworkClient(Dio(), baseUrl: baseUrl);

  Future<DailyDuaModel> getDailyDua(
      {int number = 1, required String language}) async {
    Map<String, dynamic>? dua = CacheManager<Map<String, dynamic>>()
        .readData(key: CacheManagerEnum.dua.name);

    if (dua != null) {
      DateTime parsed = DateFormat("dd-MM-yyyy").parse(dua['date']);
      DateTime now = DateTime.now();
      if (parsed.day == now.day &&
          parsed.month == now.month &&
          parsed.year == now.year) {
        DailyDuaModel response = DailyDuaModel.fromJson(dua['dua']);
        return response;
      }
    }

    try {
      DailyDuaModel response = await _client.getAyah(
        random.nextInt(6236).toString(),
      );
      Map<String, dynamic> cache = {
        "date": DateFormat("dd-MM-yyyy").format(DateTime.now()),
        "dua": response
      };
      await CacheManager<Map<String, dynamic>>()
          .writeData(key: CacheManagerEnum.dua.name, value: cache);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
