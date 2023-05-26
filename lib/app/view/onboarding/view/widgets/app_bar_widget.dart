import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/init/navigation/app_router.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        TextButton(
          onPressed: () =>
              context.router.replaceNamed(NavigationPaths.location.path),
          child: const Text('Skip',
              style: TextStyle(color: AppColors.secondaryColor)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
