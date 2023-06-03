import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/prayer_time/bloc/prayer_bloc.dart';
import 'package:ramadan_app/app/view/prayer_time/view/widgets/current_prayer_time_widget.dart';
import 'package:ramadan_app/app/view/prayer_time/view/widgets/weekly_calendar_widget.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({
    super.key,
  });

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  void initState() {
    context.read<PrayerBloc>().add(LoadPrayerEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: context.horizontalPaddingLow,
      child: Column(
        children: const [WeeklyCalendarWidget(), CurrentPrayerTimeWidget()],
      ),
    );
  }
}
