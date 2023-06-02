import 'package:flutter/material.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Align(
        alignment: Alignment.topRight,
        child: Text(
          "Gün ve tarih",
          style: context.textTheme.displaySmall,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(35);
}
