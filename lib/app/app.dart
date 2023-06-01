import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ramadan_app/core/init/navigation/app_router.dart';
import 'package:ramadan_app/core/init/theme/theme.dart';

class RamadanApp extends StatelessWidget {
  final _appRouter = AppRouter();

  RamadanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: CustomTheme.theme(),
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
