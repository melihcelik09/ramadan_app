import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ramadan_app/app/view/prayer_time/bloc/prayer_bloc.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';
import 'package:shimmer/shimmer.dart';

class CurrentPrayerTimeWidget extends StatelessWidget {
  const CurrentPrayerTimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String currentTime = DateFormat('kk:mm').format(DateTime.now());
    return BlocBuilder<PrayerBloc, PrayerState>(
      builder: (context, state) {
        if (state is PrayerLoaded) {
          List times = state.prayers[state.selectedPrayerIndex];
          bool isToday = state.selectedPrayerIndex == 0;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: times.length,
            itemBuilder: (context, index) {
              var prayerTime = times[index];
              return Card(
                color: isToday ? getColorForPrayerTime(currentTime: currentTime, prayerTime: prayerTime) : null,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                              Text(PrayerTimes.values[index].name, style: context.textTheme.displaySmall),
                              Text(prayerTime, style: context.textTheme.displaySmall),
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
        } else if (state is PrayerLoading) {
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
          return const Center(child: Text("Error"));
        }
      },
    );
  }
}

Color? getColorForPrayerTime({required String currentTime, required String prayerTime}) {
  DateTime convertedCurrent = DateFormat('kk:mm').parse(currentTime);
  DateTime convertedPrayer = DateFormat('kk:mm').parse(prayerTime);

  if (convertedCurrent.isBefore(convertedPrayer)) {
    //Upcoming prayer times
    if (convertedPrayer.difference(convertedCurrent).inMinutes < 15) {
      return AppColors.primaryColor.withOpacity(0.7);
    } else {
      return null;
    }
  } else if (convertedCurrent.isAfter(convertedPrayer)) {
    // Prayer time is passed
    return AppColors.primaryColor.withOpacity(0.5);
  } else {
    // Prayer time is now
    return AppColors.primaryColor;
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
