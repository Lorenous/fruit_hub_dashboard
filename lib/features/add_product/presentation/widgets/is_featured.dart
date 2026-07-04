import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruit_hub_dashboard/core/utils/app_text_styles.dart';

class IsFeatured extends StatelessWidget {
  const IsFeatured({super.key, required this.value, required this.onChanged});
  final bool value;
  final void Function(bool? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Is Featured Item?', style: AppTextStyles.regular16),
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primary,
        ),
      ],
    );
  }
}
