import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/ramadan_time/view/widgets/countdown_titles.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';

class Countdown extends StatelessWidget {
  const Countdown({
    super.key,
    required this.day,
    required this.hour,
    required this.minute,
  });
  final String day;
  final String hour;
  final String minute;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              Row(
                children: [
                  CountdownTitles(text: day),
                  const CountdownTitles(
                    text: " Days",
                    isTypeTitle: true,
                  )
                ],
              ),
              Row(
                children: [
                  CountdownTitles(text: hour),
                  const CountdownTitles(text: " Hours", isTypeTitle: true)
                ],
              ),
              Row(
                children: [
                  CountdownTitles(text: minute),
                  const CountdownTitles(text: " Minutes", isTypeTitle: true)
                ],
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Alert ",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: AppColors.secondaryColor),
            ),
            CupertinoSwitch(
              value: true,
              activeColor: AppColors.secondaryColor,
              onChanged: (value) {},
            ),
          ],
        ),
      ],
    );
  }
}
