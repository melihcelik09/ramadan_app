import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/ramadan_time/view/widgets/countdown_titles.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';

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
                  CountdownTitles(
                    text: context.loc.days,
                    isTypeTitle: true,
                  )
                ],
              ),
              Row(
                children: [
                  CountdownTitles(text: hour),
                  CountdownTitles(text: context.loc.hours, isTypeTitle: true)
                ],
              ),
              Row(
                children: [
                  CountdownTitles(text: minute),
                  CountdownTitles(text: context.loc.minutes, isTypeTitle: true)
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
              context.loc.alert,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: context.theme.secondaryHeaderColor),
            ),
            CupertinoSwitch(
              value: true,
              activeColor: context.theme.hoverColor,
              onChanged: (value) {},
            ),
          ],
        ),
      ],
    );
  }
}
