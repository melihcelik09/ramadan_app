import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ramadan_app/app/view/asma_al_husna/model/asma_al_husna.dart';
import 'package:ramadan_app/core/constants/app_endpoints.dart';
import 'package:ramadan_app/core/init/network/network_client.dart';

class AsmaAlHusnaService {
  final NetworkClient _client;
  final String baseUrl;
  AsmaAlHusnaService({required this.baseUrl})
      : _client =
            NetworkClient(Dio(), baseUrl: AppEndpoints.asmaulHusnaBaseUrl);

  Future<AsmaAlHusna> getAsmaAlHusna() async {
    String key = dotenv.env['X_RAPID_API_KEY'] ?? "";
    try {
      final response = await _client.getAsmaulHusna(key);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
