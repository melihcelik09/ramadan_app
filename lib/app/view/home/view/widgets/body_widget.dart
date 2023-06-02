import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/home/service/daily_dua_service.dart';
import 'package:ramadan_app/app/view/home/view/widgets/categories_card.dart';
import 'package:ramadan_app/app/view/home/view/widgets/titles_card.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/constants/app_endpoints.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';
import 'package:shimmer/shimmer.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DailyDuaService service =
        DailyDuaService(baseUrl: AppEndpoints.randomAyahBaseUrl);
    return Padding(
      padding: PaddingExtensionSymetric(context).horizontalPaddingNormal,
      child: Column(
        children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: context.width / context.height * 2.14,
            ),
            itemBuilder: (context, index) {
              return TitlesCard(
                index: index,
              );
            },
          ),
          Expanded(
            child: FutureBuilder(
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
                                "Daily Dua",
                                style: context.textTheme.displaySmall,
                              ),
                              Image.asset(
                                "assets/images/titles/Dua Hands.png",
                              )
                            ],
                          ),
                          Expanded(
                            child: Text(
                              snapshot
                                  .data!
                                  .data![snapshot.data!.data!.indexWhere(
                                      (element) =>
                                          element.edition!.language == "tr")]
                                  .text.toString(),
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
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Categories",
              style: context.textTheme.displaySmall,
            ),
          ),
          SizedBox(
            height: ContextExtension(context).height * 0.14,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) => CategoriesCard(
                index: index,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
