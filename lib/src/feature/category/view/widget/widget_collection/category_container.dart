import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/database/models/category_model.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/bill/view/page/bill_img.dart';
import 'package:tax_project/src/feature/periods/view/widget/text_widget/period_text.dart';
import 'package:tax_project/src/feature/register/model/form_model.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/app_button.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/register_form.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
    required this.model,
    required this.taxPeriod,
    required this.categoryId,
  });
  final int categoryId;

  final String taxPeriod;
  final Category model;

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
        child: Center(child: PeriodText.buttonText(model.title!)),
      ),
    );
  }
}

Future<dynamic> percentageDialog(
  BuildContext context,
  periods,
  year,
  category,
  List<double> percentages,
  String taxPeriod,
  categoryId,
) {
  final value = TextEditingController();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppTheme.lightAppColors.background,
        content: SizedBox(
          width: context.screenWidth,
          height: 500,
          child: Column(
            children: [
              SizedBox(
                width: context.screenWidth,
                height: context.screenHeight * 0.1 * percentages.length,
                child: ListView.separated(
                  itemCount: percentages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(BillImgPage(
                          periods: periods,
                          year: year,
                          category: category,
                          equation: percentages[index],
                          percentageValue: percentages[index],
                          taxPeriod: taxPeriod,
                          categoryId: categoryId,
                        ));
                      },
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
                          child: Center(
                            child: PeriodText.buttonText(
                                percentages[index].toString()),
                          )),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: context.screenHeight * .03,
                    );
                  },
                ),
              ),
              Container(
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
                  child: FormWidget(
                      formModel: FormModel(
                          controller: value,
                          enableText: false,
                          hintText: "اخرى",
                          invisible: false,
                          validator: null,
                          type: TextInputType.number,
                          inputFormat: []))),
              SizedBox(
                height: context.screenHeight * .03,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: context.screenWidth,
                height: context.screenWidth * 0.15,
                child: AppButton(
                    model: AppButtonModel(
                  title: "إضافة",
                  onTap: () {
                    Get.to(BillImgPage(
                      periods: periods,
                      year: year,
                      category: category,
                      equation: double.parse(value.text),
                      percentageValue: double.parse(value.text),
                      taxPeriod: taxPeriod,
                      categoryId: categoryId,
                    ));
                  },
                )),
              )
            ],
          ),
        ),
      );
    },
  );
}
