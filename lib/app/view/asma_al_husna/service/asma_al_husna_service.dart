import 'package:dio/dio.dart';
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
    try {
      final response = await _client
          .getAsmaulHusna('77bd26fb72mshd52097b4eaa3e06p1a44b8jsn68fc3dc01507');
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
