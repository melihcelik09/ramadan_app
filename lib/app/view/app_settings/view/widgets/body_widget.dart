import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/app_settings/bloc/app_settings_bloc.dart';
import 'package:ramadan_app/app/view/app_settings/view/widgets/custom_card.dart';
import 'package:ramadan_app/app/view/app_settings/view/widgets/language_buttons.dart';
import 'package:ramadan_app/app/view/app_settings/view/widgets/location_select.dart';
import 'package:ramadan_app/app/view/app_settings/view/widgets/theme_buttons.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingMedium,
      child: BlocBuilder<AppSettingsBloc, AppSettingsState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "App Settings",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                "Language",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              CustomCard(
                height: context.dynamicHeight(0.15),
                child: const LanguageButtons(),
              ),
              Text(
                "Theme",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              CustomCard(
                height: context.dynamicHeight(0.2),
                child: const ThemeButtons(),
              ),
              Text(
                "Location",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              CustomCard(
                height: context.dynamicHeight(0.23),
                child: const LocationSelect(),
              ),
            ],
          );
        },
      ),
    );
  }
}
