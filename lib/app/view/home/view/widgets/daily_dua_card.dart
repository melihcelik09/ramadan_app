import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/app_settings/bloc/app_settings_bloc.dart';
import 'package:ramadan_app/app/view/home/model/daily_dua/daily_dua_model.dart';
import 'package:ramadan_app/app/view/home/service/daily_dua/daily_dua_service.dart';
import 'package:ramadan_app/core/constants/app_endpoints.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';
import 'package:ramadan_app/core/init/theme/theme.dart';
import 'package:shimmer/shimmer.dart';

class DailyDuaCard extends StatelessWidget {
  const DailyDuaCard({super.key});

  @override
  Widget build(BuildContext context) {
    DailyDuaService service =
        DailyDuaService(baseUrl: AppEndpoints.randomAyahBaseUrl);
    return FutureBuilder(
      future: service.getDailyDua(
          language: context.read<AppSettingsBloc>().state.locale.languageCode),
      builder: (context, AsyncSnapshot<DailyDuaModel> snapshot) {
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
                        context.loc.dailyDua,
                        style: context.textTheme.displaySmall,
                      ),
                      Image.asset(
                        "assets/images/titles/Dua Hands.png",
                        color: context.read<AppSettingsBloc>().state.theme ==
                                AppTheme.lightTheme
                            ? Colors.black
                            : Colors.white,
                      )
                    ],
                  ),
                  Padding(
                    padding: context.verticalPaddingLow,
                    child: Text(
                      context.loc.localeName == "tr"
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
                    style: context.textTheme.labelLarge,
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
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
