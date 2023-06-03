import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_app/core/common/custom_app_bar_widget.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';
import 'package:smooth_compass/utils/src/compass_ui.dart';

@RoutePage()
class QiableFinderView extends StatelessWidget {
  const QiableFinderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(),
      body: Padding(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Qiable Finder", style: context.textTheme.displayMedium),
            SmoothCompass(
              isQiblahCompass: true,
              compassBuilder: (context, compassData, compassAsset) {
                return Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: context.normalValue,
                  children: [
                    SizedBox(
                      height: context.dynamicHeight(0.5),
                      width: context.width,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset("assets/images/qiable_finder/face.png"),
                          ),
                          Positioned.fill(
                            child: AnimatedRotation(
                              duration: context.lowDuration,
                              turns: compassData?.data?.qiblahOffset ?? 0,
                              child: Image.asset("assets/images/qiable_finder/needle.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: context.dynamicWidth(0.8),
                      height: context.dynamicHeight(0.1),
                      child: Card(
                        child: Padding(
                          padding: context.horizontalPaddingLow,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Qiblah Offset",
                                style: context.textTheme.displaySmall,
                              ),
                              Text(
                                "${compassData?.data?.qiblahOffset.toStringAsFixed(2) ?? "0"}°",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
