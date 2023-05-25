import 'package:flutter/material.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';

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
      title: const Align(
        alignment: Alignment.topRight,
        child: Text(
          "Gün ve tarih",
          style: TextStyle(color: AppColors.secondaryColor),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
