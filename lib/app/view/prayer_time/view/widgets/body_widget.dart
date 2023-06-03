import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/prayer_time/bloc/prayer_bloc.dart';
import 'package:ramadan_app/app/view/prayer_time/view/widgets/current_prayer_time_widget.dart';
import 'package:ramadan_app/app/view/prayer_time/view/widgets/weekly_calendar_widget.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';
import 'package:shimmer/shimmer.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CalendarWidget();
  }
}

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
    context.read<PrayerBloc>().add(PrayerFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: context.horizontalPaddingLow,
      child: Column(
        children: [
          const WeeklyCalendarWidget(),
          BlocBuilder<PrayerBloc, PrayerState>(
            builder: (context, state) {
              if (state.isLoading ?? true) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: context.width * 0.3,
                      width: context.width * 0.8,
                      child: Shimmer.fromColors(
                          enabled: true,
                          baseColor: Colors.grey.shade300,
                          highlightColor: AppColors.cardColor,
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: AppColors.cardColor,
                              ),
                            ),
                          )),
                    );
                  },
                  itemCount: 7,
                );
              } else {
                return CurrentPrayerTimeWidget(
                  times: state.times[state.selectedPrayerIndex],
                  isToday: state.selectedPrayerIndex == 0 ? true : false,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
