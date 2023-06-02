import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/location/cubit/location_cubit.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';

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
  @override
  void initState() {
    location = context.read<LocationCubit>().fetchUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "${location.region}, ${location.country}",
      "Next Time",
      "Time Alert"
    ];
    List<String> imageUrls = [
      "assets/images/titles/Map.png",
      "assets/images/titles/Asr.png",
      "assets/images/titles/Alarm.png"
    ];
    return Card(
        color: AppColors.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: widget.index != 1
            ? Padding(
                padding: context.paddingLow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        titles[
                            widget.index > 1 ? widget.index - 1 : widget.index],
                        style: context.textTheme.titleMedium,
                      ),
                    ), // Your Location
                    Image.asset(
                      imageUrls[
                          widget.index > 1 ? widget.index - 1 : widget.index],
                      fit: BoxFit.fill,
                    ),
                    widget.index == 3
                        ? CupertinoSwitch(
                            value: true,
                            activeColor: AppColors.secondaryColor,
                            onChanged: (value) {},
                          )
                        : widget.index == 2
                            ? Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Asr",
                                        style: context.textTheme.titleMedium,
                                      ),
                                      Text(
                                        "16:00",
                                        style: context.textTheme.titleMedium,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Kalan Süre",
                                        style: context.textTheme.titleMedium,
                                      ),
                                      Text(
                                        "2:00",
                                        style: context.textTheme.titleMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : const Text("Location"),
                  ],
                ),
              )
            // : Column(
            //     children: [
            //       Text('Partly Cloudy'),
            //       ClipRRect(
            //         child: Image.asset(
            //           imageUrls[index],
            //           fit: BoxFit.fill,
            //         ),
            //       ),
            //     ],
            //   ),
            : const SizedBox.shrink());
  }
}
