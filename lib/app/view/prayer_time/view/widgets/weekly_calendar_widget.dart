import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ramadan_app/app/view/prayer_time/bloc/prayer_bloc.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';

class WeeklyCalendarWidget extends StatelessWidget {
  const WeeklyCalendarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: context.verticalPaddingLow,
          height: context.width * 0.4,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: DateTime.daysPerWeek,
            itemBuilder: (context, index) {
              DateTime currentDate = DateTime.now().add(Duration(days: index));
              DateTime nextDate = currentDate.add(const Duration(days: 1));
              bool shouldDisplayMonthName = currentDate.month != nextDate.month;
              String dayName = DateFormat.EEEE().format(currentDate).substring(0, 3);
              String dayNumber = DateFormat.d().format(currentDate);
              String monthName = DateFormat.MMMM().format(currentDate);
              return Row(
                children: [
                  Column(
                    children: [
                      Text(dayName, style: context.textTheme.headlineMedium),
                      SizedBox(
                        height: context.height * 0.1,
                        width: context.width * 0.2,
                        child: BlocBuilder<PrayerBloc, PrayerState>(
                          builder: (context, state) {
                            return Card(
                              color: (state is PrayerLoaded) && state.selectedPrayerIndex == index
                                  ? AppColors.primaryColor
                                  : context.theme.cardColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () {
                                  context.read<PrayerBloc>().add(SelectPrayerEvent(index: index));
                                },
                                child: Center(
                                  child: Text(dayNumber, style: context.textTheme.displaySmall),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  shouldDisplayMonthName
                      ? Container(
                          margin: context.horizontalPaddingNormal,
                          child: Text(monthName),
                        )
                      : const SizedBox(),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
