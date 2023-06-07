import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/home/service/daily_service/daily_weather_service.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/constants/app_endpoints.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';
import 'package:shimmer/shimmer.dart';

class DailyWeatherCard extends StatefulWidget {
  const DailyWeatherCard({super.key});

  @override
  State<DailyWeatherCard> createState() => _DailyWeatherCardState();
}

class _DailyWeatherCardState extends State<DailyWeatherCard> {
  @override
  Widget build(BuildContext context) {
    DailyWeatherService service =
        DailyWeatherService(baseUrl: AppEndpoints.weatherBaseUrl);

    return FutureBuilder(
      future: service.dailyWeather(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: context.paddingLow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    snapshot.data!.current!.condition!.text!,
                    style: context.textTheme.titleMedium,
                  ),
                ), // Your Location
                Expanded(
                  child: Image.network(
                    "https:${snapshot.data!.current!.condition!.icon!}",
                    fit: BoxFit.fill,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Temp",
                      style: context.textTheme.titleMedium,
                    ),
                    Text(
                      "${snapshot.data!.current!.tempCelcius}C°",
                      style: context.textTheme.titleMedium,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${snapshot.data!.current!.lastUpdated}",
                      style: context.textTheme.bodyMedium,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.refresh,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Error"),
          );
        } else {
          return Shimmer.fromColors(
            enabled: true,
            baseColor: Colors.grey.shade300,
            highlightColor: AppColors.cardColor,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.cardColor,
              ),
            ),
          );
        }
      },
    );
  }
}
