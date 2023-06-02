import 'package:flutter/material.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';

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
            style: context.textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: Text(
            information,
            maxLines: 15,
            style: context.textTheme.titleLarge,
          ),
        ),
      ],
    );
  }
}
