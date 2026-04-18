import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruit_hub_dashboard/core/utils/app_text_styles.dart';

AppBar buildCustomAppBar(
  BuildContext context, {
  required String text,
  bool showBackButton = true,
  List<Widget>? actions,
}) {
  return AppBar(
    actions: actions,
    automaticallyImplyLeading: false,
    centerTitle: true,
    title: Text(text, style: AppTextStyles.bold19),
    leading: showBackButton
        ? IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.mainText,
              size: 22,
            ),
          )
        : null,
  );
}
