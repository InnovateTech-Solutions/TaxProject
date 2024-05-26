import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/feature/bills_series/view/page/bills_series_page.dart';
import 'package:tax_project/src/feature/category/view/page/category_page.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/app_button.dart';
import 'package:tax_project/src/feature/tax_calculation/view/main/tax_calcuation_page.dart';

class PreCategoryWidget extends StatelessWidget {
  const PreCategoryWidget(
      {super.key, required this.periods, required this.year});
  final String periods;
  final String year;
  @override
  Widget build(BuildContext context) {
    List<AppButtonModel> button = [
      AppButtonModel(
          title: "البيان",
          onTap: () {
            Get.to(CategoryPage(periods: periods, year: year));
          }),
      AppButtonModel(
          title: "احتساب الضريبة المستحقة و الرد والرصيد المدور للفترة القادمة",
          onTap: () {
            Get.to(TaxCalculationPage(
              periods: periods,
              year: year,
            ));
          }),
      AppButtonModel(
          title:
              "تسلسل ارقام فواتير المبيعات و البيانات المتعلقة بفواتير المبيعات",
          onTap: () {
            Get.to(BillSeriesPage(periods: periods, year: year));
          }),
      AppButtonModel(
          title: " كشوفات اخرى",
          onTap: () {
            Get.to(CategoryPage(periods: periods, year: year));
          }),
    ];
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: context.screenHeight * 0.2,
          ),
          DelayedDisplay(
            delay: const Duration(milliseconds: 300),
            slidingCurve: Curves.easeInOutQuint,
            child: Container(
              margin: const EdgeInsets.all(20),
              width: context.screenWidth,
              height: context.screenHeight,
              child: GridView.builder(
                itemBuilder: (context, index) {
                  return Container(
                      padding: const EdgeInsets.all(5),
                      child: AppButton(model: button[index]));
                },
                itemCount: button.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
