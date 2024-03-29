import 'package:flutter/material.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/register/view/widget/text_widget/register_text.dart';

class SteperContainer extends StatelessWidget {
  const SteperContainer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
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
                // color: Colors.yellow),
              ),
              child: Center(child: RegisterText.iconText("1")),
            ),
            Container(
              width: 100,
              height: 2,
              color: AppTheme.lightAppColors.iconcolor,
            ),
            Container(
              width: 0.1 * context.screenWidth,
              height: 0.05 * context.screenHeight,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppTheme.lightAppColors.iconcolor,
                  width: 2.0,
                ),
                // color: Colors.yellow),
              ),
              child: Center(child: RegisterText.iconText("2")),
            ),
          ],
        ),
      ],
    );
  }
}
