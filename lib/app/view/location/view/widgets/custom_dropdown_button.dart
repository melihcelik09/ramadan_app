import 'package:flutter/material.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';

class CustomDropdownButton extends StatelessWidget {
  final List<DropdownMenuItem> items;
  final void Function(dynamic)? onChanged;
  final String? hint;
  final dynamic value;

  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.onChanged,
    this.hint,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.primaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      icon: const Icon(Icons.expand_more, color: Colors.white),
      items: items,
      onChanged: onChanged,
      value: value,
      hint: Text(hint ?? 'Select', style: context.textTheme.titleLarge?.copyWith(color: Colors.white)),
    );
  }
}
