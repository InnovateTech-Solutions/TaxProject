import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/periods/controller/periods_controller.dart';
import 'package:tax_project/src/feature/periods/view/pages/classified_periods_page.dart';
import 'package:tax_project/src/feature/periods/view/widget/text_widget/period_text.dart';
import 'package:tax_project/src/feature/periods/view/widget/widget_collectio.dart/periods_button.dart';
import 'package:tax_project/src/feature/periods/view/widget/widget_collectio.dart/year_form.dart';

class PeriodsWidget extends StatelessWidget {
  const PeriodsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PeriodsController());
    return Container(
      margin: const EdgeInsets.all(20),
      height: context.screenHeight,
      child: SingleChildScrollView(
        child: Form(
          key: controller.fromKey,
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
                height: context.screenHeight * 0.15,
              ),
              DelayedDisplay(
                delay: const Duration(milliseconds: 300),
                child: PeriodText.mainText(
                    "اختر الفترة الضريبية لإقرارك الضريبي\n عن طريق الاختيار بين الفترات \nالفردية أو الزوجية."),
              ),
              SizedBox(
                height: context.screenHeight * 0.1,
              ),
              DelayedDisplay(
                delay: const Duration(seconds: 1),
                child: YearForm(
                  yearModel: YearFormModel(
                    controller: controller.yearController,
                    hintText: "السنة",
                    type: TextInputType.number,
                    ontap: () {},
                    enableText: false,
                    onChange: null,
                    inputFormat: [
                      LengthLimitingTextInputFormatter(4),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (year) => controller.yearValidate(year!),
                  ),
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
              DelayedDisplay(
                  delay: const Duration(seconds: 1),
                  child: PeriodsButton(
                      title: "فترات الزوجية",
                      onTap: () {
                        if (controller.fromKey.currentState!.validate()) {
                          Get.to(
                              ClassifiedPeriodsPage(
                                periods: 'odd',
                                year: controller.yearController.text,
                              ),
                              transition: Transition.fade);
                        } else {
                          String year = ''; // Example year input
                          String? validationResult =
                              controller.yearValidate(year);
                          Get.snackbar('خطأ', validationResult!);
                        }
                      })),
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
              DelayedDisplay(
                  delay: const Duration(seconds: 1),
                  child: PeriodsButton(
                      title: "الفترات الفردية",
                      onTap: () {
                        if (controller.fromKey.currentState!.validate()) {
                          Get.to(
                              ClassifiedPeriodsPage(
                                  periods: 'even',
                                  year: controller.yearController.text),
                              transition: Transition.fade);
                        }
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
