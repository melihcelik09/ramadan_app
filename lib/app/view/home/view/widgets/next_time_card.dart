import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ramadan_app/app/view/prayer_time/bloc/prayer_bloc.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';
import 'package:shimmer/shimmer.dart';

class NextTimeCard extends StatefulWidget {
  const NextTimeCard({super.key});

  @override
  State<NextTimeCard> createState() => _NextTimeCardState();
}

class _NextTimeCardState extends State<NextTimeCard> {
  late Timer timer;
  late String currentTime;
  @override
  void initState() {
    currentTime = DateFormat('yyyy-MM-dd kk:mm').format(DateTime.now());
    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        currentTime = DateFormat('yyyy-MM-dd kk:mm').format(DateTime.now());
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      "assets/images/prayer/Fajr.png",
      "assets/images/prayer/Sunrise.png",
      "assets/images/prayer/Dhuhr.png",
      "assets/images/prayer/Asr.png",
      "assets/images/prayer/Maghrib.png",
      "assets/images/prayer/Isha.png",
    ];
    List<String> timeName = [
      context.loc.fajr,
      context.loc.sun,
      context.loc.dhuhr,
      context.loc.asr,
      context.loc.maghrib,
      context.loc.isha,
    ];
    return BlocBuilder<PrayerBloc, PrayerState>(
      builder: (context, state) {
        if (state is PrayerLoaded) {
          List times = state.prayers[state.selectedPrayerIndex];
          int? index = getIndexOfNextTime(
              currentTime: currentTime,
              prayerTimes: state.prayers[state.selectedPrayerIndex]);
          if (index == null) {
            times = state.prayers[state.selectedPrayerIndex + 1];
            index = 0;
          }
          List<int> remaningTime;
          try {
            remaningTime = calculateRemainingTime(currentTime, times[index], 0);
          } catch (e) {
            remaningTime = calculateRemainingTime(currentTime, times[index], 1);
          }

          return Padding(
            padding: context.paddingLow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    context.loc.nextTime,
                    style: context.textTheme.titleMedium,
                  ),
                ),
                Image.asset(
                  imageUrls[index],
                  fit: BoxFit.fill,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          timeName[index],
                          style: context.textTheme.titleMedium,
                        ),
                        Text(
                          times[index],
                          style: context.textTheme.titleMedium,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.loc.remainingTime,
                          style: context.textTheme.titleMedium,
                        ),
                        Text(
                          remaningTime[0] == 0
                              ? "${remaningTime[1]} dk"
                              : "${remaningTime[0]} sa ${remaningTime[1] == 0 ? "" : "${remaningTime[1]} dk"}",
                          style: context.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        } else if (state is PrayerLoading) {
          return Shimmer.fromColors(
            enabled: true,
            baseColor: Colors.grey.shade300,
            highlightColor: context.theme.cardColor,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: context.theme.cardColor,
              ),
            ),
          );
        } else {
          return const Center(
            child: Text("Error"),
          );
        }
      },
    );
  }
}

int? getIndexOfNextTime(
    {required String currentTime, required List prayerTimes}) {
  DateTime convertedCurrent = DateFormat('yyyy-MM-dd kk:mm').parse(currentTime);

  for (var i = 0; i < prayerTimes.length; i++) {
    List newList = [];
    String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    newList.addAll([date, prayerTimes[i]]);

    var joinedValues = newList.join(" ");
    DateTime convertedPrayer =
        DateFormat('yyyy-MM-dd kk:mm').parse(joinedValues);

    if (convertedCurrent.isBefore(convertedPrayer)) {
      return i;
    }
  }
  return null;
}

List<int> calculateRemainingTime(
    String currentTime, String prayerTime, int day) {
  DateTime convertedCurrent = DateFormat('yyyy-MM-dd kk:mm').parse(currentTime);

  List newList = [];
  String date = DateFormat('yyyy-MM-dd').format(
    DateTime.now().add(
      Duration(days: day),
    ),
  );
  newList.addAll([date, prayerTime]);

  var joinedValues = newList.join(" ");
  DateTime convertedPrayer = DateFormat('yyyy-MM-dd kk:mm').parse(joinedValues);

  if (convertedPrayer.difference(convertedCurrent).inHours < 0) {
    throw Exception();
  }
  List<int> remainingTime = [];
  remainingTime.add(convertedPrayer.difference(convertedCurrent).inHours);
  remainingTime
      .add(convertedPrayer.difference(convertedCurrent).inMinutes % 60);
  return remainingTime;
}
