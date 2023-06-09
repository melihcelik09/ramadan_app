import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/asma_al_husna/service/asma_al_husna_service.dart';
import 'package:ramadan_app/app/view/asma_al_husna/view/widgets/custom_card.dart';
import 'package:ramadan_app/app/view/asma_al_husna/view/widgets/custom_row.dart';
import 'package:ramadan_app/core/constants/app_endpoints.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';
import 'package:shimmer/shimmer.dart';

class AsmaAlHusnaCard extends StatelessWidget {
  const AsmaAlHusnaCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    AsmaAlHusnaService service =
        AsmaAlHusnaService(baseUrl: AppEndpoints.asmaulHusnaBaseUrl);

    return FutureBuilder(
      future: service.getAsmaAlHusna(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List data = snapshot.data?.main ?? [];
          return InkWell(
            onTap: () {
              showModalBottomSheet(
                  useSafeArea: true,
                  backgroundColor: context.theme.cardColor,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  )),
                  context: context,
                  builder: (context) => SingleChildScrollView(
                        padding: context.paddingLow,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: context.horizontalPaddingHigh * 2,
                              child: Divider(
                                thickness: 3,
                                color: context.theme.secondaryHeaderColor,
                              ),
                            ),
                            Wrap(
                              alignment: WrapAlignment.center,
                              runSpacing: context.mediumValue,
                              children: [
                                SizedBox(
                                  height: context.height * 0.2,
                                  width: context.width * 0.4,
                                  child: CustomCard(
                                    data: data,
                                    index: index,
                                    color: Colors.white,
                                  ),
                                ),
                                CustomRow(
                                    data: data,
                                    index: index,
                                    title: "Meaning",
                                    information: data[index].meaning ?? ''),
                                CustomRow(
                                  data: data,
                                  index: index,
                                  title: "Explanation",
                                  information: data[index].explanation ?? '',
                                ),
                                CustomRow(
                                  data: data,
                                  index: index,
                                  title: "Benefit",
                                  information: data[index].benefit ?? '',
                                ),
                              ],
                            )
                          ],
                        ),
                      ));
            },
            child: CustomCard(
              data: data,
              index: index,
              color: context.theme.cardColor,
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
            ),
          );
        }
      },
    );
  }
}
