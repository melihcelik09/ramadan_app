import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';
import 'package:ramadan_app/core/init/navigation/app_router.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: context.paddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            children: [
              Text(
                'Select Location',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor,
                    ),
              ),
              Text(
                'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium ',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.secondaryColor,
                      fontSize: 18,
                    ),
              ),
            ],
          ),
          //DROPDOWNS
          //COUNTRY
          //STATE
          //CITY
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    context.router.pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
                  },
                  child: Text(
                    'Go to Home Page',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: AppColors.secondaryColor, fontSize: 16, fontWeight: FontWeight.bold),
                  )),
            ],
          )
        ],
      ),
    ));
  }
}
