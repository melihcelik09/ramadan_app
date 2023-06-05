import 'package:flutter/cupertino.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';

class TimeAlertCard extends StatelessWidget {
  const TimeAlertCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              context.loc.timeAlert,
              style: context.textTheme.titleMedium,
            ),
          ), // Your Location
          Image.asset(
            "assets/images/titles/Alarm.png",
            fit: BoxFit.fill,
          ),
          CupertinoSwitch(
            value: true,
            activeColor: AppColors.secondaryColor,
            onChanged: (value) {},
          )
        ],
      ),
    );
  }
}
