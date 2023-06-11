import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:ramadan_app/app/view/home/model/daily_name/daily_name_model.dart';
import 'package:ramadan_app/core/init/cache/cache_manager.dart';
import 'package:ramadan_app/core/init/network/network_client.dart';

class DailyNameService {
  final NetworkClient _client;
  final String baseUrl;
  DailyNameService({required this.baseUrl}) : _client = NetworkClient(Dio(), baseUrl: baseUrl);

  Future<List?> getDailyName({int number = 1, required String language}) async {
    Map<String, dynamic>? nameList = CacheManager<Map<String, dynamic>>().readData(key: CacheManagerEnum.baby.name);
    if (nameList != null) {
      DateTime parsed = DateFormat("dd-MM-yyyy").parse(nameList['date']);
      DateTime now = DateTime.now();
      if (parsed.day == now.day && parsed.month == now.month && parsed.year == now.year) {
        return nameList['names'];
      }
    }
    String key = dotenv.env['BEHIND_THE_NAME_API_KEY'] ?? "";
    try {
      List<DailyNameModel> results = await Future.wait([
        _client.getDailyName(key, "f", "$number", language.country),
        _client.getDailyName(key, "m", "$number", language.country)
      ]);
      String? babyGirl = results[0].names?[0];
      String? babyBoy = results[1].names?[0];
      Map<String, Object> cache = {
        "date": DateFormat("dd-MM-yyyy").format(DateTime.now()),
        "names": [babyGirl, babyBoy]
      };
      await CacheManager<Map<String, dynamic>>().writeData(key: CacheManagerEnum.baby.name, value: cache);
      return [babyGirl, babyBoy];
    } catch (e) {
      throw Exception(e);
    }
  }
}

extension DailyNameLanguageExtension on String {
  String get country {
    switch (this) {
      case "tr":
        return "tur";
      default:
        return "usa";
    }
  }
}
