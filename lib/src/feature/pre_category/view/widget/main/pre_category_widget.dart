import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/bills_series/view/page/bills_series_page.dart';
import 'package:tax_project/src/feature/category/view/page/category_page.dart';
import 'package:tax_project/src/feature/other/view/page/other_page.dart';
import 'package:tax_project/src/feature/register/view/widget/text_widget/register_text.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/app_button.dart';
import 'package:tax_project/src/feature/tax_calculation/view/main/tax_calcuation_page.dart';
import 'package:tax_project/src/feature/tax_calculation/view/text/tax_text.dart';

class PreCategoryWidget extends StatelessWidget {
  const PreCategoryWidget({
    super.key,
    required this.periods,
    required this.year,
    required this.taxPeriod,
  });
  final String taxPeriod;
  final String periods;
  final String year;
  @override
  Widget build(BuildContext context) {
    List<AppButtonModel> button = [
      AppButtonModel(
          title: "بيانات الإقرار",
          onTap: () {
            Get.to(CategoryPage(
              periods: periods,
              year: year,
              taxPeriod: taxPeriod,
            ));
          }),
      AppButtonModel(
          title: "احتساب الضريبة المستحقة",
          onTap: () {
            Get.to(TaxCalculationPage(
              periods: periods,
              year: year,
              taxPeriod: taxPeriod,
            ));
          }),
      AppButtonModel(
          title: " ارقام فواتير المبيعات",
          onTap: () {
            Get.to(BillSeriesPage(periods: periods, year: year));
          }),
      AppButtonModel(
          title: "كشوفات اخرى ",
          onTap: () {
            Get.to(OtherPage());
          }),
    ];
    return Container(
      color: AppTheme.lightAppColors.background,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  width: context.screenWidth,
                  height: context.screenWidth * 0.45,
                  decoration: BoxDecoration(
                      color: AppTheme.lightAppColors.primary.withOpacity(0.2),
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(500))),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: context.screenWidth,
                  height: context.screenWidth * 0.45,
                  decoration: BoxDecoration(
                      color: AppTheme.lightAppColors.primary.withOpacity(0.2),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(250),
                          bottomRight: Radius.circular(200))),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: AppTheme.lightAppColors.iconcolor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: context.screenHeight * 0.05,
                      ),
                      TaxText.thirdText("اختر للمتابعة إلى الخطوة التالية"),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: context.screenHeight * .01,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: AppTheme.lightAppColors.background,
                  width: context.screenWidth,
                  height: context.screenHeight * 0.5,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                          padding: const EdgeInsets.all(5),
                          child: preContainer(button[index], context));
                    },
                    itemCount: button.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: context.screenHeight * .001,
                      );
                    },
                  ),
                ),
                Image.asset("assets/img/man.jpg")
              ],
            ),
          ],
        ),
      ),
    );
  }
}

preContainer(AppButtonModel model, BuildContext context) {
  return GestureDetector(
    onTap: model.onTap,
    child: Container(
      padding: const EdgeInsets.all(10),
      width: context.screenWidth,
      height: context.screenHeight * 0.1,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            child: Image.asset("assets/img/file.png"),
          ),
          SizedBox(
            width: context.screenWidth * 0.025,
          ),
          RegisterText.thirdIconText(model.title)
        ],
      ),
    ),
  );
}
