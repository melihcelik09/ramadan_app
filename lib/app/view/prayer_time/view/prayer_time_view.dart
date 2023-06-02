import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/prayer_time/view/widgets/body_widget.dart';

class PrayerTimeView extends StatelessWidget {
  const PrayerTimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.secondaryColor,
        elevation: 0,
        actions: [
          Padding(
            padding: context.paddingLow,
            child: Text(DateFormat('EEEE, d MMMM').format(DateTime.now()),
                style: context.textTheme.headlineMedium),
          ),
        ],
      ),
      body: const BodyWidget(),
    );
  }
}
