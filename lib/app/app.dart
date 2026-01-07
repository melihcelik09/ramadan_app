import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/app_settings/bloc/app_settings_bloc.dart';
import 'package:ramadan_app/core/init/localization/app_localizations.dart';
import 'package:ramadan_app/core/init/navigation/app_router.dart';

class RamadanApp extends StatelessWidget {
  final _appRouter = AppRouter();

  RamadanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsBloc, AppSettingsState>(
      builder: (context, state) {
        return MaterialApp.router(
          theme: state.themeData,
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(),
          locale: state.locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}
