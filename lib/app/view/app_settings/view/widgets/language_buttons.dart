import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/app_settings/bloc/app_settings_bloc.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';

class LanguageButtons extends StatelessWidget {
  const LanguageButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return RadioGroup<Languages>(
      onChanged: (Languages? value) {
        if (value == null) return;

        final locale = value == Languages.turkce
            ? const Locale("tr", "TR")
            : const Locale("en", "EN");

        context.read<AppSettingsBloc>().add(
          SelectLanguage(language: value, locale: locale),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Türkçe", style: Theme.of(context).textTheme.titleLarge),
              Radio<Languages>(
                activeColor: context.theme.primaryColor,
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                materialTapTargetSize: MaterialTapTargetSize.padded,
                value: Languages.turkce,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("English", style: Theme.of(context).textTheme.titleLarge),
              Radio<Languages>(
                activeColor: context.theme.primaryColor,
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                materialTapTargetSize: MaterialTapTargetSize.padded,
                value: Languages.english,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
