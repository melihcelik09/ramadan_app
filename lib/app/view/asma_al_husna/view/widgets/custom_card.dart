import 'package:flutter/material.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.data,
    required this.index,
    required this.color,
  });

  final List data;
  final int index;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(data[index].arName ?? '', style: context.textTheme.titleMedium),
          Text(
            data[index].enName ?? '',
            style: context.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
