import 'package:flutter/material.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';

class TitlesCard extends StatelessWidget {
  const TitlesCard({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    List<String> titles = ["Your Location", "Next Time", "Time Alert"];
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
        child: index != 1
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(titles[
                            index > 1 ? index - 1 : index])), // Your Location
                    Image.asset(
                      imageUrls[index > 1 ? index - 1 : index],
                      fit: BoxFit.fill,
                    ),
                    const Text('Partly Cloudy'),
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
