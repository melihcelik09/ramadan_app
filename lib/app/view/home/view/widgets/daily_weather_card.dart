import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/home/model/daily_weather/daily_weather_model.dart';
import 'package:ramadan_app/app/view/home/model/daily_weather/weather_language_model.dart';
import 'package:ramadan_app/app/view/home/service/daily_service/daily_weather_service.dart';
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
    DailyWeatherService service = DailyWeatherService();

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
                FutureBuilder(
                  future: snapshot.data!.current!.condition!.language(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          snapshot.data.toString(),
                          style: context.textTheme.titleMedium,
                        ),
                      );
                    } else {
                      return Shimmer.fromColors(
                        enabled: true,
                        baseColor: Colors.grey.shade300,
                        highlightColor: context.theme.cardColor,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: context.theme.cardColor,
                          ),
                          height: 20,
                          width: 100,
                        ),
                      );
                    }
                  },
                ),
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
                      child: Icon(
                        Icons.refresh,
                        color: context.theme.secondaryHeaderColor,
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
            highlightColor: context.theme.cardColor,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: context.theme.cardColor,
              ),
            ),
          );
        }
      },
    );
  }
}

extension GetLanguage on ConditionModel {
  Future<String> language(BuildContext context) async {
    String deneme = "";
    await DailyWeatherService().readJson().then((value) {
      WeatherLanguage text =
          value[value.indexWhere((element) => element.code == code)];

      for (var element in text.languages!) {
        if (element.langIso == context.loc.localeName) {
          deneme = element.dayText!;
          break;
        } else if (context.loc.localeName == "en") {
          deneme = text.day!;
          break;
        }
      }
    });
    return deneme;
  }
}
