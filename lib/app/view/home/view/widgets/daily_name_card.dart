import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/app_settings/bloc/app_settings_bloc.dart';
import 'package:ramadan_app/app/view/home/service/daily_name/daily_name_service.dart';
import 'package:ramadan_app/core/constants/app_endpoints.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';
import 'package:ramadan_app/core/init/theme/theme.dart';
import 'package:shimmer/shimmer.dart';

class DailyNameCard extends StatelessWidget {
  const DailyNameCard({super.key});

  @override
  Widget build(BuildContext context) {
    DailyNameService service =
        DailyNameService(baseUrl: AppEndpoints.dailyNameBaseUrl);
    return FutureBuilder(
      future: service.getDailyName(language: context.loc.localeName),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Card(
            color: context.theme.cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: context.paddingLow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.loc.dailyName,
                        style: context.textTheme.displaySmall,
                      ),
                      Image.asset(
                        "assets/images/titles/Birth.png",
                        color: context.read<AppSettingsBloc>().state.theme ==
                                AppTheme.lightTheme
                            ? Colors.black
                            : Colors.white,
                      )
                    ],
                  ),
                  Wrap(
                    runSpacing: 20,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/images/titles/Baby_girl.png"),
                          Text(snapshot.data?[0])
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset("assets/images/titles/Baby_boy.png"),
                          Text(snapshot.data?[1])
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error ${snapshot.error}"),
          );
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: context.theme.cardColor,
            child: Container(
              height: context.height * 0.2,
              width: context.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: context.theme.cardColor,
              ),
            ),
          );
        }
      },
    );
  }
}
