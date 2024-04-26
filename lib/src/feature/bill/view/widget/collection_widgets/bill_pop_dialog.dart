import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/bill/controller/bill_controller.dart';
import 'package:tax_project/src/feature/register/view/widget/text_widget/register_text.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/app_button.dart';

void showPopupButtons(BuildContext context) {
  final controller = Get.put(BillController());
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
        height: context.screenHeight * .3,
        width: context.screenWidth,
        child: Column(
          children: [
            SizedBox(
              height: context.screenHeight * .01,
            ),
            GestureDetector(
              onTap: () {
                controller.pickImages();
              },
              child: Container(
                width: context.screenWidth,
                height: context.screenHeight * 0.08,
                decoration: BoxDecoration(
                  color: AppTheme.lightAppColors.primary,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10)),
                ),
                child: Center(child: RegisterText.secIconText("صور الهاتف")),
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.takeImages();
              },
              child: Container(
                width: context.screenWidth,
                height: context.screenHeight * 0.08,
                decoration: BoxDecoration(
                  color: AppTheme.lightAppColors.primary,
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(10)),
                ),
                child: Center(child: RegisterText.secIconText("الكاميرا")),
              ),
            ),
            SizedBox(
              height: context.screenHeight * .02,
            ),
            AppButton(title: "الغاء", onTap: () {}),
          ],
        ),
      );
    },
  );
}
