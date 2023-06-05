import 'package:flutter/material.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final String? hint;
  final T? value;
  final bool appSettings;

  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.onChanged,
    this.hint,
    this.value,
    this.appSettings = false,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,
      decoration: appSettings
          ? const InputDecoration.collapsed(
              hintText: "",
              border: UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
            )
          : InputDecoration(
              filled: true,
              fillColor: AppColors.primaryColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
      icon: Icon(Icons.expand_more,
          color: appSettings ? AppColors.secondaryColor : Colors.white),
      items: items,
      onChanged: onChanged,
      value: value,
      hint: Text(
        hint ?? 'Select',
        style: context.textTheme.titleLarge?.copyWith(
          color: appSettings ? AppColors.secondaryColor : Colors.white,
        ),
      ),
    );
  }
}
