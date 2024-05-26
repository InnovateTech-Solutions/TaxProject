import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/feature/bill/view/page/bill_img.dart';
import 'package:tax_project/src/feature/category/controller/category_controller.dart';
import 'package:tax_project/src/feature/category/view/widget/widget_collection/category_container.dart';
import 'package:tax_project/src/feature/tax_calculation/view/main/tax_calcuation_page.dart';

import '../../../../../config/themes/theme.dart';
import '../../../../periods/view/widget/text_widget/period_text.dart';

class CategoeyWidget extends StatelessWidget {
  const CategoeyWidget({super.key, required this.periods, required this.year});
  final String periods;
  final String year;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: context.screenWidth * 0.05,
                ),
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
            Row(
              children: [
                SizedBox(
                  width: context.screenWidth * 0.055,
                ),
                PeriodText.secText("اختر البيان الضريبي الذي تريد تعبئته"),
              ],
            ),
            SizedBox(
              height: context.screenHeight * 0.025,
            ),
            SizedBox(
              width: context.screenWidth,
              height: context.screenHeight * 0.67,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (controller.category[index].percentage!) {
                          percentageDialog(context, controller.category[index],
                              periods, year, controller.category[index].title);
                        } else {
                          Get.to(BillImgPage(
                            periods: periods,
                            year: year,
                            category: controller.category[index].title,
                            equation: 0,
                          ));
                        }
                      },
                      child: CategoryContainer(
                        model: controller.category[index],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: context.screenHeight * 0.03);
                  },
                  itemCount: controller.category.length),
            ),
            GestureDetector(
              onTap: () {
                Get.to(const TaxCalculationPage());
              },
              child: Container(
                padding: const EdgeInsets.only(left: 2, right: 2),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                        "احتساب الضريبة المستحقة والرد\n الرصيد المدور للفترة القادمة")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
