import 'package:flutter/material.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.data,
    required this.index,
    required this.title,
    required this.information,
  });

  final List data;
  final int index;
  final String title;
  final String information;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryColor),
          ),
        ),
        Expanded(
          child: Text(information,
              maxLines: 15,
              style: const TextStyle(
                fontSize: 18,
                color: AppColors.secondaryColor,
              )),
        ),
      ],
    );
  }
}
