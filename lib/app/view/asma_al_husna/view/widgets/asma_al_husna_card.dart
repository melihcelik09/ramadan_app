import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/asma_al_husna/model/asma_al_husna.dart';
import 'package:ramadan_app/app/view/asma_al_husna/view/widgets/custom_card.dart';
import 'package:ramadan_app/app/view/asma_al_husna/view/widgets/custom_row.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/constants/app_endpoints.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';
import 'package:ramadan_app/core/init/network/network_client.dart';

class AsmaAlHusnaCard extends StatelessWidget {
  const AsmaAlHusnaCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    Future<AsmaAlHusna> getAsmaAlHusna() async {
      final response = await NetworkClient(dio,
              baseUrl: AppEndpoints.asmaulHusnaBaseUrl)
          .getAsmaulHusna('77bd26fb72mshd52097b4eaa3e06p1a44b8jsn68fc3dc01507');
      return response;
    }

    return FutureBuilder(
      future: getAsmaAlHusna(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List data = snapshot.data?.main ?? [];
          return InkWell(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: AppColors.cardColor,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    )),
                    context: context,
                    builder: (context) => SizedBox(
                          height: context.height * 0.9,
                          child: Padding(
                            padding: context.paddingLow,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: context.horizontalPaddingHigh * 2,
                                  child: const Divider(
                                    thickness: 3,
                                    color: AppColors.secondaryColor,
                                  ),
                                ),
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
                            ),
                          ),
                        ));
              },
              child: CustomCard(
                data: data,
                index: index,
                color: AppColors.cardColor,
              ));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
