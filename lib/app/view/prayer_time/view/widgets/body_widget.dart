import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ramadan_app/app/view/prayer_time/model/prayer_time_model.dart';
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
    List<PrayerTimeModel> prayerTimeList = [
      PrayerTimeModel(
        image: 'assets/images/prayer/Fajr.png',
        name: 'Fajr',
        time: '04:00',
      ),
      PrayerTimeModel(
        image: 'assets/images/prayer/Dhuhr.png',
        name: 'Dhuhr',
        time: '04:00',
      ),
      PrayerTimeModel(
        image: 'assets/images/prayer/Asr.png',
        name: 'Asr',
        time: '04:00',
      ),
      PrayerTimeModel(
        image: 'assets/images/prayer/Maghrib.png',
        name: 'Maghrib',
        time: '04:00',
      ),
      PrayerTimeModel(
        image: 'assets/images/prayer/Isha.png',
        name: 'Isha',
        time: '04:00',
      ),
    ];
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: prayerTimeList.length,
      itemBuilder: (context, index) {
        var prayerTime = prayerTimeList[index];
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
                  Image.asset(
                    prayerTime.image ?? "Image Error",
                    width: context.width * 0.2,
                    height: context.width * 0.2,
                  ),
                  Padding(
                    padding: context.horizontalPaddingNormal + context.onlyRightPaddingHigh,
                    child: Text(prayerTime.name ?? "Name Error", style: context.textTheme.titleLarge),
                  ),
                  Text(prayerTime.time ?? "Time Error", style: context.textTheme.titleLarge),
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
