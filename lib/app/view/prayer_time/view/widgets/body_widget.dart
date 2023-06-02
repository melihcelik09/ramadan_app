import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CalendarWidget();
  }
}

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: context.horizontalPaddingLow,
      child: Column(
        children: const [
          WeeklyCalendarWidget(),
          CurrentPrayerTimeWidget(),
        ],
      ),
    );
  }
}

class CurrentPrayerTimeWidget extends StatelessWidget {
  const CurrentPrayerTimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {},
            child: Padding(
              padding: context.paddingNormal,
              child: Row(
                children: [
                  const Placeholder(fallbackHeight: 100, fallbackWidth: 100),
                  Padding(
                    padding: context.horizontalPaddingNormal + context.onlyRightPaddingHigh,
                    child: Text('Imsak', style: context.textTheme.titleLarge),
                  ),
                  Text('04:00', style: context.textTheme.titleLarge),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class WeeklyCalendarWidget extends StatelessWidget {
  const WeeklyCalendarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  context.router.pop();
                },
                icon: const Icon(Icons.arrow_back_ios)),
            Text(DateFormat('EEEE, d MMMM').format(DateTime.now()), style: context.textTheme.titleLarge),
          ],
        ),
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
              String dayName = DateFormat.EEEE().format(currentDate).split('').first;
              String dayNumber = DateFormat.d().format(currentDate);
              String monthName = DateFormat.MMMM().format(currentDate);
              return Row(
                children: [
                  Column(
                    children: [
                      Text(dayName, style: context.textTheme.titleLarge),
                      SizedBox(
                        height: context.height * 0.1,
                        width: context.width * 0.2,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {},
                            child: Center(child: Text(dayNumber, style: context.textTheme.titleLarge)),
                          ),
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
