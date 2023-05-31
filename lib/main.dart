import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/app.dart';
import 'package:ramadan_app/core/init/bloc/bloc_list.dart';

void main() async {
  runApp(
    MultiBlocProvider(
      providers: [...BlocList.instance.items],
      child: RamadanApp(),
    ),
  );
}
