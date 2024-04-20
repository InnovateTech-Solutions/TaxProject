import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/register/controller/register_controller.dart';
import 'package:tax_project/src/feature/register/view/widget/text_widget/register_text.dart';

class SteperContainer extends StatelessWidget {
  const SteperContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 0.1 * context.screenWidth,
          height: 0.05 * context.screenHeight,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppTheme.lightAppColors.iconcolor,
              width: 2.0,
            ),
            color: AppTheme.lightAppColors.iconcolor,
          ),
          child: Center(child: RegisterText.secIconText("1")),
        ),
        Container(
          width: 100,
          height: 2,
          color: AppTheme.lightAppColors.iconcolor,
        ),
        Obx(
          () => Container(
            width: 0.1 * context.screenWidth,
            height: 0.05 * context.screenHeight,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppTheme.lightAppColors.iconcolor,
                  width: 2.0,
                ),
                color: controller.currentPageIndex.value == 1
                    ? AppTheme.lightAppColors.iconcolor
                    : AppTheme.lightAppColors.background),
            child: Center(
                child: controller.currentPageIndex.value == 1
                    ? RegisterText.secIconText("2")
                    : RegisterText.iconText("2")),
          ),
        ),
      ],
    );
  }
}
