import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/database/db_controllers/tax_form_controller.dart';
import 'package:tax_project/src/config/database/models/tax_form_model.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/periods/controller/periods_controller.dart';
import 'package:tax_project/src/feature/periods/view/widget/text_widget/period_text.dart';
import 'package:tax_project/src/feature/pre_category/view/pages/pre_category_page.dart';
import 'package:tax_project/src/feature/tax_calculation/view/text/tax_text.dart';

///////////////odd 0
//////////////even 1
class ClassifiedPeriodsWidget extends StatefulWidget {
  const ClassifiedPeriodsWidget(
      {super.key,
      required this.periods,
      required this.year,
      required this.view});
  final String view;
  final String periods;
  final String year;

  @override
  State<ClassifiedPeriodsWidget> createState() =>
      _ClassifiedPeriodsWidgetState();
}

class _ClassifiedPeriodsWidgetState extends State<ClassifiedPeriodsWidget> {
  final localTaxFormController = Get.put(TaxFormController());

  @override
  void initState() {
    localTaxFormController.getTaxForms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PeriodsController());
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TaxText.thirdText(" الفترات"),
                TaxText.thirdText(
                    widget.periods == "odd" ? " الفردية" : " الزوجية"),
              ],
            ),
            SizedBox(
              height: context.screenHeight * 0.05,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: context.screenWidth,
              height: context.screenHeight * 0.75,
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        await localTaxFormController
                            .getTaxFormsByYearAndTaxPeriod(
                          widget.year,
                          widget.periods == "odd"
                              ? controller.oddList[index]
                              : controller.evenList[index],
                        );
                        if (localTaxFormController.taxForms.isEmpty) {
                          localTaxFormController.addTaxForm(TaxForm(
                              period: widget.periods == "odd" ? 0 : 1,
                              year: widget.year,
                              taxPeriod: widget.periods == "odd"
                                  ? controller.oddList[index]
                                  : controller.evenList[index],
                              userId: 5));
                        }
                        Get.to(
                            PreCategoryPage(
                              view: widget.view,
                              periods: widget.periods,
                              year: widget.year,
                              taxPeriod: widget.periods == "odd"
                                  ? controller.oddList[index]
                                  : controller.evenList[index],
                            ),
                            transition: Transition.fade,
                            duration: const Duration(milliseconds: 500));
                      },
                      child: periodContainer(
                          context,
                          widget.periods == "odd"
                              ? controller.oddList[index]
                              : controller.evenList[index],
                          index),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: context.screenHeight * 0.04);
                  },
                  itemCount: widget.periods == "odd"
                      ? controller.oddList.length
                      : controller.evenList.length),
            )
          ],
        ),
      ),
    );
  }
}

DelayedDisplay periodContainer(
    BuildContext context, String title, int duration) {
  return DelayedDisplay(
    delay: Duration(milliseconds: duration * 200),
    slidingCurve: Curves.linear,
    slidingBeginOffset: duration.isOdd
        ? const Offset(-1.0, 0.0)
        : const Offset(1.0, 0.0), // Start from left
    child: GestureDetector(
      child: Container(
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
          borderRadius: BorderRadius.circular(15),
          color: AppTheme.lightAppColors.primary,
        ),
        child: Center(child: PeriodText.buttonText(title)),
      ),
    ),
  );
}
