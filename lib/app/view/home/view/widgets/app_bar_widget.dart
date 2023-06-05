import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ramadan_app/app/view/app_settings/bloc/app_settings_bloc.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
//        backgroundColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Align(
        alignment: Alignment.topRight,
        child: context.read<AppSettingsBloc>().state.locale ==
                const Locale("tr", "TR")
            ? Text(
                DateFormat('EEEE, d MMMM y', 'tr').format(DateTime.now()),
                style: context.textTheme.displaySmall,
              )
            : Text(
                DateFormat('EEEE, d MMMM y', 'en').format(DateTime.now()),
                style: context.textTheme.displaySmall,
              ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
