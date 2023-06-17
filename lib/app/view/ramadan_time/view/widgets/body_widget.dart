import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/ramadan_time/service/countdown_service.dart';
import 'package:ramadan_app/app/view/ramadan_time/view/widgets/countdown.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: Column(
        children: [
          SizedBox(
            height: context.height / 3,
            width: context.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(context.loc.ramadanCountdown,
                    style: Theme.of(context).textTheme.displayMedium),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    "assets/images/ramadan_time/Ramadan.png",
                    width: 128,
                    height: 128,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: context.verticalPaddingMedium,
            child: FutureBuilder(
              future: CountdownService().requestHijriforGregorian(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Container(
                    decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: BorderRadius.circular(16)),
                    height: context.height / 2.5,
                    width: context.width,
                    child: Countdown(
                      day: snapshot.data!.days.toString(),
                      hour: snapshot.data!.hours.toString(),
                      minute: snapshot.data!.minutes.toString(),
                    ),
                  );
                } else {
                  return Container(
                      decoration: BoxDecoration(
                          color: context.theme.cardColor,
                          borderRadius: BorderRadius.circular(16)),
                      height: context.height / 2.5,
                      width: context.width,
                      child: const Center(child: CircularProgressIndicator()));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
