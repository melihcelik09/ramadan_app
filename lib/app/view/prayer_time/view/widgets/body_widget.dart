import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ramadan_app/app/view/prayer_time/bloc/prayer_bloc.dart';
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
      child: BlocBuilder<PrayerBloc, PrayerState>(
        builder: (context, state) {
          if (state is PrayerInitial) {
            BlocProvider.of<PrayerBloc>(context).add(PrayerFetchEvent());
          }
          return state is PrayerLoaded
              ? Column(
                  children: [
                    const WeeklyCalendarWidget(),
                    CurrentPrayerTimeWidget(times: state.times[state.selectedPrayerIndex]),
                  ],
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class CurrentPrayerTimeWidget extends StatelessWidget {
  final List times;
  const CurrentPrayerTimeWidget({
    super.key,
    required this.times,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('CurrentPrayerTimeWidget: $times');
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: times.length,
      itemBuilder: (context, index) {
        var prayerTime = times[index];
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
                    PrayerTimes.values[index].image,
                    width: context.width * 0.2,
                    height: context.width * 0.2,
                  ),
                  SizedBox(
                    width: context.dynamicWidth(0.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(PrayerTimes.values[index].name),
                        Text(prayerTime),
                      ],
                    ),
                  )
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
                            onTap: () {
                              context.read<PrayerBloc>().add(PrayerSelectedEvent(index: index));
                            },
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

enum PrayerTimes { fajr, sunrise, dhuhr, asr, maghrib, isha }

extension PrayerTimesImage on PrayerTimes {
  String get image {
    switch (this) {
      case PrayerTimes.fajr:
        return "assets/images/prayer/Fajr.png";
      case PrayerTimes.sunrise:
        return "assets/images/prayer/Sunrise.png";
      case PrayerTimes.dhuhr:
        return "assets/images/prayer/Dhuhr.png";
      case PrayerTimes.asr:
        return "assets/images/prayer/Asr.png";
      case PrayerTimes.maghrib:
        return "assets/images/prayer/Maghrib.png";
      case PrayerTimes.isha:
        return "assets/images/prayer/Isha.png";
    }
  }
}

extension PrayerTimesName on PrayerTimes {
  String get name {
    switch (this) {
      case PrayerTimes.fajr:
        return "Fajr";
      case PrayerTimes.sunrise:
        return "Sunrise";
      case PrayerTimes.dhuhr:
        return "Dhuhr";
      case PrayerTimes.asr:
        return "Asr";
      case PrayerTimes.maghrib:
        return "Maghrib";
      case PrayerTimes.isha:
        return "Isha";
    }
  }
}
