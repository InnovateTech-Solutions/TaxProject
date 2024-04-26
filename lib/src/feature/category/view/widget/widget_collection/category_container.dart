import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/category/model/category_model.dart';
import 'package:tax_project/src/feature/periods/view/widget/text_widget/period_text.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({Key? key, required this.model}) : super(key: key);
  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      delay: const Duration(milliseconds: 300),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: context.screenWidth,
        height: context.screenWidth * 0.15,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
          color: AppTheme.lightAppColors.primary,
        ),
        child: Center(child: PeriodText.buttonText(model.title)),
      ),
    );
  }
}

Future<dynamic> percentageDialog(BuildContext context, model) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppTheme.lightAppColors.background,
        content: SizedBox(
          width: context.screenWidth,
          height: context.screenHeight * 0.1 * model.percentageValue!.length,
          child: ListView.separated(
            itemCount: model.percentageValue!.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: context.screenWidth,
                  height: context.screenWidth * 0.15,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: AppTheme.lightAppColors.primary,
                  ),
                  child: Center(
                    child: PeriodText.buttonText(
                        model.percentageValue![index].toString()),
                  ));
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: context.screenHeight * .03,
              );
            },
          ),
        ),
      );
    },
  );
}
