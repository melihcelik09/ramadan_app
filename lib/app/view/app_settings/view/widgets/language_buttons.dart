import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/app_settings/bloc/app_settings_bloc.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';

class LanguageButtons extends StatelessWidget {
  const LanguageButtons({super.key});

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
                context.read<AppSettingsBloc>().add(
                      SelectLanguage(language: value),
                    );
              },
            )
          ],
        )
      ],
    );
  }
}
