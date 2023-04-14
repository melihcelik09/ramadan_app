import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ramadan_app/app/app.dart';
import 'package:ramadan_app/core/init/bloc/bloc_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/env/.env");
  await GetStorage.init();
  runApp(
    MultiBlocProvider(
      providers: [...BlocList.instance.items],
      child: RamadanApp(),
    ),
  );
}
