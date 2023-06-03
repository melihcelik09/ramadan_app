import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.secondaryColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          context.router.pop();
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
