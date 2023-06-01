import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';

Future<void> appConfiguration() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/env/.env");
  await _cacheConfiguration();
}

Future<void> _cacheConfiguration() async {
  await GetStorage.init();
}
