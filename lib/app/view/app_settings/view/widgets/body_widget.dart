import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/app_settings/bloc/app_settings_bloc.dart';
import 'package:ramadan_app/app/view/app_settings/view/widgets/language_buttons.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                height: context.dynamicHeight(0.2),
                child: const LocationSelect(),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.height,
    required this.child,
  });

  final Widget child;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingMedium.copyWith(bottom: 16, top: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.cardColor,
      ),
      width: context.width,
      height: height,
      child: child,
    );
  }
}

class ThemeButtons extends StatelessWidget {
  const ThemeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "System",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Radio<Languages>(
              activeColor: AppColors.primaryColor,
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              materialTapTargetSize: MaterialTapTargetSize.padded,
              value: Languages.turkce,
              groupValue: context.watch<AppSettingsBloc>().state.language,
              onChanged: (Languages? value) {
                context
                    .read<AppSettingsBloc>()
                    .add(SelectLanguage(language: value));
              },
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Light",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Radio<Languages>(
              activeColor: AppColors.primaryColor,
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              materialTapTargetSize: MaterialTapTargetSize.padded,
              value: Languages.english,
              groupValue: context.watch<AppSettingsBloc>().state.language,
              onChanged: (Languages? value) {
                context.read<AppSettingsBloc>().add(
                      SelectLanguage(language: value),
                    );
              },
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Dark",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Radio<Languages>(
              activeColor: AppColors.primaryColor,
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              materialTapTargetSize: MaterialTapTargetSize.padded,
              value: Languages.turkce,
              groupValue: context.watch<AppSettingsBloc>().state.language,
              onChanged: (Languages? value) {
                context
                    .read<AppSettingsBloc>()
                    .add(SelectLanguage(language: value));
              },
            )
          ],
        ),
      ],
    );
  }
}

class LocationSelect extends StatelessWidget {
  const LocationSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Country",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Radio<Languages>(
              activeColor: AppColors.primaryColor,
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              materialTapTargetSize: MaterialTapTargetSize.padded,
              value: Languages.turkce,
              groupValue: context.watch<AppSettingsBloc>().state.language,
              onChanged: (Languages? value) {
                context
                    .read<AppSettingsBloc>()
                    .add(SelectLanguage(language: value));
              },
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "State",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Radio<Languages>(
              activeColor: AppColors.primaryColor,
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              materialTapTargetSize: MaterialTapTargetSize.padded,
              value: Languages.english,
              groupValue: context.watch<AppSettingsBloc>().state.language,
              onChanged: (Languages? value) {
                context.read<AppSettingsBloc>().add(
                      SelectLanguage(language: value),
                    );
              },
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "City",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Radio<Languages>(
              activeColor: AppColors.primaryColor,
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              materialTapTargetSize: MaterialTapTargetSize.padded,
              value: Languages.turkce,
              groupValue: context.watch<AppSettingsBloc>().state.language,
              onChanged: (Languages? value) {
                context
                    .read<AppSettingsBloc>()
                    .add(SelectLanguage(language: value));
              },
            )
          ],
        ),
      ],
    );
  }
}
