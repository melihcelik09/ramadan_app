import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'network_client.g.dart';

@RestApi(baseUrl: "base")
abstract class NetworkClient {
  factory NetworkClient(Dio dio, {String baseUrl}) = _NetworkClient;
}
