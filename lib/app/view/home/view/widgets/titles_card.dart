import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/home/view/widgets/location_card.dart';
import 'package:ramadan_app/app/view/home/view/widgets/next_time_card.dart';
import 'package:ramadan_app/app/view/home/view/widgets/time_alert_card.dart';
import 'package:ramadan_app/app/view/location/cubit/location_cubit.dart';
import 'package:ramadan_app/app/view/location/model/user_location_model.dart';
import 'package:ramadan_app/app/view/prayer_time/bloc/prayer_bloc.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';

class TitlesCard extends StatefulWidget {
  const TitlesCard({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<TitlesCard> createState() => _TitlesCardState();
}

class _TitlesCardState extends State<TitlesCard> {
  late UserLocationModel location;

  @override
  void initState() {
    location = context.read<LocationCubit>().fetchUserLocation();
    context.read<PrayerBloc>().add(LoadPrayerEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: widget.index == 0
          ? const LocationCard()
          : widget.index == 1
              ? const SizedBox.shrink()
              : widget.index == 2
                  ? const NextTimeCard()
                  : const TimeAlertCard(),
    );
  }
}
