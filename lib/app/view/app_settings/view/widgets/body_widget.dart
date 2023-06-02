import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/app_settings/bloc/app_settings_bloc.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingMedium,
      child: Column(
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
          Container(
            padding: context.paddingMedium.copyWith(bottom: 16, top: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.cardColor,
            ),
            width: context.width,
            height: context.height * 0.15,
            child: BlocBuilder<AppSettingsBloc, AppSettingsState>(
              builder: (context, state) {
                return const LanguageButtons();
              },
            ),
          )
        ],
      ),
    );
  }
}

class LanguageButtons extends StatefulWidget {
  const LanguageButtons({super.key});

  @override
  State<LanguageButtons> createState() => _LanguageButtonsState();
}

class _LanguageButtonsState extends State<LanguageButtons> {
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
              "Türkçe",
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
                context.read<AppSettingsBloc>().add(SelectLanguage(language: value));
              },
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "English",
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
                context.read<AppSettingsBloc>().add(SelectLanguage(language: value));
              },
            )
          ],
        )
      ],
    );
  }
}
