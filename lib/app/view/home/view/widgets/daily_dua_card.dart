import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/app_settings/bloc/app_settings_bloc.dart';
import 'package:ramadan_app/app/view/home/service/daily_dua/daily_dua_service.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/constants/app_endpoints.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';
import 'package:shimmer/shimmer.dart';

class DailyDuaCard extends StatelessWidget {
  const DailyDuaCard({super.key});

  @override
  Widget build(BuildContext context) {
    DailyDuaService service =
        DailyDuaService(baseUrl: AppEndpoints.randomAyahBaseUrl);
    return FutureBuilder(
      future: service.getDailyDua(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Card(
            color: AppColors.cardColor,
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
                        context.loc.dailyDua,
                        style: context.textTheme.displaySmall,
                      ),
                      Image.asset(
                        "assets/images/titles/Dua Hands.png",
                      )
                    ],
                  ),
                  Expanded(
                    child: Text(
                      context.read<AppSettingsBloc>().state.locale ==
                              const Locale("tr", "TR")
                          ? snapshot
                              .data!
                              .data![snapshot.data!.data!.indexWhere(
                                  (element) =>
                                      element.edition!.language == "tr")]
                              .text
                              .toString()
                          : snapshot
                              .data!
                              .data![snapshot.data!.data!.indexWhere(
                                  (element) =>
                                      element.edition!.language == "en")]
                              .text
                              .toString(),
                      style: context.textTheme.bodyMedium,
                    ),
                  ),
                  Text(
                    "${snapshot.data!.data![0].surah!.englishName} ${snapshot.data!.data![0].numberInSurah}",
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Error"),
          );
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: AppColors.cardColor,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.cardColor,
              ),
            ),
          );
        }
      },
    );
  }
}
