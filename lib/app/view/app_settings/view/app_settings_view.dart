import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/app_settings/view/widgets/body_widget.dart';

class AppSettingsView extends StatelessWidget {
  const AppSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: BodyWidget(),
    );
  }
}
