import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ramadan_app/app/app.dart';
import 'package:ramadan_app/app/views/home/bloc/home_bloc.dart';
import 'package:ramadan_app/app/views/onboarding/bloc/onboarding_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<OnboardingBloc>(create: (context) => OnboardingBloc()),
      BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
    ],
    child: RamadanApp(),
  ));
}
