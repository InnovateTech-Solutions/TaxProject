import 'package:flutter/material.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/feature/register/view/widget/text_widget/register_text.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/steper_container.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: context.screenHeight * 0.01,
          horizontal: context.screenWidth * 0.1),
      width: context.screenWidth,
      height: context.screenHeight,
      child: Form(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SteperContainer(),
          SizedBox(
            height: context.screenHeight * 0.05,
          ),
          RegisterText.mainText("ادخل معلواتك الخاصة"),
          RegisterText.secText(
              "لتسهيل إكمال جميع النماذج قم بإضافة معلوماتك الأساسية."),
        ]),
      ),
    );
  }
}
