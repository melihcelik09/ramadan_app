import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:ramadan_app/app/view/app_settings/bloc/app_settings_bloc.dart';
import 'package:ramadan_app/app/view/bottom_navbar/bloc/bottom_navbar_bloc.dart';
import 'package:ramadan_app/app/view/home/bloc/home_bloc.dart';
import 'package:ramadan_app/app/view/location/cubit/location_cubit.dart';
import 'package:ramadan_app/app/view/onboarding/bloc/onboarding_bloc.dart';
import 'package:ramadan_app/app/view/prayer_time/bloc/prayer_bloc.dart';
import 'package:ramadan_app/app/view/splash/bloc/splash_bloc.dart';

class BlocList {
  static BlocList? _instance;
  BlocList._();
  static BlocList get instance {
    _instance ??= BlocList._();
    return _instance!;
  }

  List<SingleChildWidget> items = [
    BlocProvider<OnboardingBloc>(create: (context) => OnboardingBloc()),
    BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
    BlocProvider<BottomNavbarBloc>(create: (context) => BottomNavbarBloc()),
    BlocProvider<AppSettingsBloc>(create: (context) => AppSettingsBloc()),
    BlocProvider<LocationCubit>(create: (context) => LocationCubit()),
    BlocProvider<SplashBloc>(create: (context) => SplashBloc()),
    BlocProvider<PrayerBloc>(create: (context) => PrayerBloc())
  ];
}
