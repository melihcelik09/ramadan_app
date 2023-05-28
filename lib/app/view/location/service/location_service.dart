import 'package:dio/dio.dart';
import 'package:ramadan_app/app/view/location/model/location_model.dart';
import 'package:ramadan_app/core/init/network/network_client.dart';

class LocationService {
  final NetworkClient _client;
  final String baseUrl;
  LocationService({required this.baseUrl})
      : _client = NetworkClient(Dio(), baseUrl: baseUrl);

  Future<List<LocationModel>> fetchCountries() async {
    try {
      List<LocationModel> response = await _client.getCountries();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<String>> fetchStates({required String country}) async {
    try {
      List<String> response = await _client.getState(country);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<String>> fetchCities(
      {required String country, required String state}) async {
    try {
      List<String> response = await _client.getCity(country, state);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
