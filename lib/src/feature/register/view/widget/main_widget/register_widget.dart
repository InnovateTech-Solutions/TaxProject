import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/feature/register/controller/register_controller.dart';
import 'package:tax_project/src/feature/register/view/widget/main_widget/first_register_widget.dart';
import 'package:tax_project/src/feature/register/view/widget/main_widget/sec_register_widget.dart';
import 'package:tax_project/src/feature/register/view/widget/text_widget/register_text.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/app_button.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/steper_container.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: context.screenHeight * 0.01,
        ),
        width: context.screenWidth,
        height: context.screenHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SteperContainer(),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: context.screenWidth * 0.1),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: context.screenHeight * 0.03,
                    ),
                    RegisterText.mainText("ادخل معلواتك الخاصة"),
                    RegisterText.secText(
                        "لتسهيل إكمال جميع النماذج\n قم بإضافة معلوماتك الأساسية."),
                    SizedBox(
                      height: context.screenHeight * 0.05,
                    ),
                  ]),
            ),
            SizedBox(
              width: context.screenWidth * 1,
              height: context.screenHeight * 0.57,
              child: PageView(
                controller: controller.pageController,
                onPageChanged: (index) {
                  controller.currentPageIndex.value = index;
                },
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: context.screenWidth * 0.1),
                      child: const FirstRegiterWidget()),
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: context.screenWidth * 0.1),
                      child: const SecRegisterWidget()),
                ],
              ),
            ),
            AppButton(
                model: AppButtonModel(
              title: "التالي",
              onTap: () {
                controller.nextPage();
              },
            ))
          ],
        ),
      ),
    );
  }
}
