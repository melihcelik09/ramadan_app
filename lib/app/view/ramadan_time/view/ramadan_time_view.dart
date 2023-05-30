import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/ramadan_time/view/widgets/app_bar_widget.dart';
import 'package:ramadan_app/app/view/ramadan_time/view/widgets/body_widget.dart';

@RoutePage()
class RamadanTimeView extends StatelessWidget {
  const RamadanTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(),
      body: BodyWidget(),
    );
  }
}
