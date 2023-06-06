import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ramadan_app/app/view/prayer_time/view/widgets/calendar_widget.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';

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
            child: Text(
              DateFormat('EEEE, d MMMM', context.loc.localeName).format(DateTime.now()),
              style: context.textTheme.headlineMedium,
            ),
          ),
        ],
      ),
      body: const CalendarWidget(),
    );
  }
}
