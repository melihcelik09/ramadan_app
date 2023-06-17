import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/app_settings/bloc/app_settings_bloc.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';
import 'package:ramadan_app/core/init/theme/theme.dart';

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
              context.loc.system,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Radio<AppTheme>(
              activeColor: context.theme.primaryColor,
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              materialTapTargetSize: MaterialTapTargetSize.padded,
              value: AppTheme.systemTheme,
              groupValue: context.watch<AppSettingsBloc>().state.theme,
              onChanged: (AppTheme? value) {
                context.read<AppSettingsBloc>().add(
                      SelectTheme(
                        appTheme: value,
                      ),
                    );
              },
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.loc.light,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Radio<AppTheme>(
              activeColor: context.theme.primaryColor,
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              materialTapTargetSize: MaterialTapTargetSize.padded,
              value: AppTheme.lightTheme,
              groupValue: context.watch<AppSettingsBloc>().state.theme,
              onChanged: (AppTheme? value) {
                context.read<AppSettingsBloc>().add(
                      SelectTheme(
                        appTheme: value,
                      ),
                    );
              },
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.loc.dark,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Radio<AppTheme>(
              activeColor: context.theme.primaryColor,
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              materialTapTargetSize: MaterialTapTargetSize.padded,
              value: AppTheme.darkTheme,
              groupValue: context.watch<AppSettingsBloc>().state.theme,
              onChanged: (AppTheme? value) {
                context.read<AppSettingsBloc>().add(
                      SelectTheme(
                        appTheme: value,
                      ),
                    );
              },
            )
          ],
        ),
      ],
    );
  }
}
