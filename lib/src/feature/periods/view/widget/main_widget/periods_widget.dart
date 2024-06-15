import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/database/db_controllers/tax_form_controller.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/bill/view/text/bill_text.dart';
import 'package:tax_project/src/feature/periods/controller/periods_controller.dart';
import 'package:tax_project/src/feature/periods/view/pages/classified_periods_page.dart';
import 'package:tax_project/src/feature/periods/view/widget/text_widget/period_text.dart';
import 'package:tax_project/src/feature/periods/view/widget/widget_collectio.dart/periods_button.dart';
import 'package:tax_project/src/feature/periods/view/widget/widget_collectio.dart/year_form.dart';
import 'package:tax_project/src/feature/view_pages/classified/view/pages/view_classified_period_page.dart';

class PeriodsWidget extends StatelessWidget {
  const PeriodsWidget({super.key, required this.view});
  final String view;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PeriodsController());
    final fromKey = GlobalKey<FormState>();
    final localTaxFormController = Get.put(TaxFormController());

    return Container(
      margin: const EdgeInsets.all(20),
      height: context.screenHeight,
      child: SingleChildScrollView(
        child: Form(
          key: fromKey,
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
                      onTap: () async {
                        if (fromKey.currentState!.validate()) {
                          if (view == "view") {
                            print(view);
                            await localTaxFormController
                                .getTaxFormsByYearAndPeriod(
                                    controller.yearController.text, 1);
                            if (localTaxFormController.existTaxForm.isEmpty) {
                              periodDialog(context, controller, "زوجية");
                            } else {
                              Get.to(
                                  ViewClassifiedPeriodsPage(
                                    periods: 'even',
                                    year: controller.yearController.text,
                                    view: view,
                                  ),
                                  transition: Transition.fade);
                            }
                          } else {
                            print(view);

                            Get.to(
                                ClassifiedPeriodsPage(
                                  periods: 'even',
                                  year: controller.yearController.text,
                                  view: view,
                                ),
                                transition: Transition.fade);
                          }
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
                      onTap: () async {
                        if (fromKey.currentState!.validate()) {
                          if (view == "view") {
                            await localTaxFormController
                                .getTaxFormsByYearAndPeriod(
                                    controller.yearController.text, 0);
                            if (localTaxFormController.existTaxForm.isEmpty) {
                              periodDialog(context, controller, "فردية");
                            } else {
                              Get.to(
                                  ViewClassifiedPeriodsPage(
                                    periods: 'odd',
                                    year: controller.yearController.text,
                                    view: view,
                                  ),
                                  transition: Transition.fade);
                            }
                          } else {
                            Get.to(
                                ClassifiedPeriodsPage(
                                  periods: 'odd',
                                  year: controller.yearController.text,
                                  view: view,
                                ),
                                transition: Transition.fade);
                          }
                        } else {
                          String year = ''; // Example year input
                          String? validationResult =
                              controller.yearValidate(year);
                          Get.snackbar('خطأ', validationResult!);
                        }
                      })),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> periodDialog(
      BuildContext context, PeriodsController controller, period) {
    return showDialog(
      // ignore: use_build_context_synchronously
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.hardEdge,
          backgroundColor: AppTheme.lightAppColors.background,
          child: Container(
              padding: const EdgeInsets.all(12),
              width: context.screenWidth,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffffffff),
                    Color(0xffA1BFE1),
                  ],
                ),
              ),
              height: context.screenHeight * 0.15,
              child: Center(
                child: BillText.thirdText(
                    ' لا يوجد فترات ${period} لسنة ${controller.yearController.text} '),
              )),
        );
      },
    );
  }
}
