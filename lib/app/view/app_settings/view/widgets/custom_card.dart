import 'package:flutter/material.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.height,
    required this.child,
  });

  final Widget child;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingMedium.copyWith(bottom: 16, top: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.theme.cardColor,
      ),
      width: context.width,
      height: height,
      child: child,
    );
  }
}
