import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:ramadan_app/app/views/home/bloc/home_bloc.dart';
import 'package:ramadan_app/app/views/onboarding/bloc/onboarding_bloc.dart';

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
  ];
}