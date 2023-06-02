import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/prayer_time/view/widgets/body_widget.dart';

class PrayerTimeView extends StatelessWidget {
  const PrayerTimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: BodyWidget()),
    );
  }
}
