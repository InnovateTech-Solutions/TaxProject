import 'package:flutter/material.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/register/view/widget/text_widget/register_text.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  AppButton({super.key, required this.model});
  AppButtonModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: model.onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: context.screenWidth,
        height: context.screenHeight * 0.08,
        decoration: BoxDecoration(
          color: AppTheme.lightAppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: RegisterText.secIconText(model.title)),
      ),
    );
  }
}

class AppButtonModel {
  String title;
  VoidCallback onTap;
  AppButtonModel({required this.title, required this.onTap});
}
