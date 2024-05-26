import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/pre_category/view/widget/main/pre_category_widget.dart';
import 'package:tax_project/src/feature/register/model/form_model.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/app_button.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/register_form.dart';
import 'package:tax_project/src/feature/tax_calculation/controller/tax_calculation_controller.dart';
import 'package:tax_project/src/feature/tax_calculation/view/text/tax_text.dart';

class TaxCalculationWidget extends StatelessWidget {
  const TaxCalculationWidget(
      {super.key, required this.periods, required this.year});
  final String periods;
  final String year;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final controller = Get.put(TaxCalculationController());
    return Container(
      margin: const EdgeInsets.all(20),
      width: context.screenWidth,
      height: context.screenHeight,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            TaxText.mainText(
                "كيفية احتساب الضريبة المستحقة والرد \nالرصيد المدور للفترة القادمة"),
            Form(
                key: formKey,
                child: Column(children: [
                  taxFormIcon(
                      context,
                      "يتم تعبأ هذا الحقل بالاعتماد على الحقول السابقة و بناء على ذلك اذا كان الناتج سالبا قم بتعبئة باقي الحقول ",
                      context.screenHeight * 0.32),
                  SizedBox(
                    height: context.screenHeight * 0.01,
                  ),
                  //the value from the form
                  FormWidget(
                      formModel: FormModel(
                          controller: controller.field1,
                          enableText: true,
                          hintText: "2000 دينار",
                          invisible: false,
                          validator: null,
                          type: TextInputType.name,
                          inputFormat: [])),
                  SizedBox(
                    height: context.screenHeight * 0.05,
                  ),
                  //First check box
                  TaxText.secText(
                      "هل ترغب باسترداد الضريبة العامة عن السلع والخدمات المصدرة ان وجدت:"),
                  taxCheckBox(
                      controller, 'نعم : عبئ المبلغ المطلوب تسترداده  '),
                  taxFormIcon(
                      context,
                      "في الحالة التي يرغب فيها المسجل بإسترداد الضريبة المدفوعة على السلع المصدرة، يتعين عليه حساب قيمة تلك الضريبة باستخدام معادلة التصنيع وإدراج الناتج في الخانة رقم ١٦ من الإقرار الضريبي. إذا كان لا يرغب في استرداد هذه الضريبة، يجب عليه وضع صفر في تلك الخانة.",
                      context.screenHeight * 0.5),
                  SizedBox(
                    height: context.screenHeight * 0.01,
                  ),
                  FormWidget(
                      formModel: FormModel(
                          controller: controller.field2,
                          enableText: true,
                          hintText: "2000 دينار",
                          invisible: false,
                          validator: null,
                          type: TextInputType.name,
                          inputFormat: [])),

                  SizedBox(
                    height: context.screenHeight * 0.07,
                  ),
                  //Second check box
                  TaxText.secText(
                      "هل ترغب باسترداد الضريبة العامةالتي مضى على دفعها اكثر من شهرين:"),
                  taxCheckBox(
                      controller, 'نعم : يرجى مراعاة دليل تعبئة الإقرار  '),
                  taxFormIcon(
                      context,
                      "إذا كان هناك ضريبة عامة مضى على تأديتها أكثر من ستة شهور ويرغب المسجل باستردادها فيقوم المسجل باحتساب تلك الضريبة وفق الآلية المتبعة لاحتساب هذه الضريبة ووضعها بهذه الخانة",
                      context.screenHeight * 0.4),
                  SizedBox(
                    height: context.screenHeight * 0.01,
                  ),
                  FormWidget(
                      formModel: FormModel(
                          controller: controller.field3,
                          enableText: true,
                          hintText: "2000 دينار",
                          invisible: false,
                          validator: null,
                          type: TextInputType.name,
                          inputFormat: [])),
                  SizedBox(
                    height: context.screenHeight * 0.03,
                  ),
                  Row(
                    children: [
                      TaxText.secText(
                          "احتسب الرصيد المدور لصالحك للفترة القادمة "),
                    ],
                  ),

                  taxFormIcon(
                      context,
                      "هذه الخانة مخصصة لاحتساب رصيدك المدور للفترة القادمة وهذا المبلغ يدور للفترة القادمة ويوضع في الإقرار اللاحق",
                      context.screenHeight * 0.3),
                  SizedBox(
                    height: context.screenHeight * 0.01,
                  ),
                  FormWidget(
                      formModel: FormModel(
                          controller: controller.field4,
                          enableText: true,
                          hintText: "2000 دينار",
                          invisible: false,
                          validator: null,
                          type: TextInputType.name,
                          inputFormat: [])),
                  SizedBox(
                    height: context.screenHeight * 0.03,
                  ),

                  TaxText.secText(
                      "في حال وجود مواد محملة بضريبة خاصة واستخدمت في انتاج سلع اخرى خاضعة للنسبة العامة وتم تصديرها وترغب في الضريبة الخاصة فيجب احتساب المبلغ المطلوب استرداده حسب معادلة التصنيع وتثبيته في هذه "),

                  // taxFormIcon(
                  //     context,
                  //     "الرصيد الضريبة العامة المدورة من إقرار الفترة السابقة ",
                  //     context.screenHeight * 0.3),
                  SizedBox(
                    height: context.screenHeight * 0.01,
                  ),
                  FormWidget(
                      formModel: FormModel(
                          controller: controller.field5,
                          enableText: true,
                          hintText: "2000 دينار",
                          invisible: false,
                          validator: null,
                          type: TextInputType.name,
                          inputFormat: [])),
                ])),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: AppButton(
                    model: AppButtonModel(
                  title: "متابعة",
                  onTap: () {
                    Get.to(PreCategoryWidget(
                      periods: periods,
                      year: year,
                    ));
                  },
                )))
          ],
        ),
      ),
    );
  }

  taxCheckBox(TaxCalculationController controller, title) {
    return Column(
      children: [
        Obx(
          () => CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: TaxText.secText(title),
            value: controller.checkboxValues[0],
            activeColor: AppTheme.lightAppColors.primary,
            onChanged: (bool? value) {
              controller.updateCheckboxState(0);
            },
          ),
        ),
        Obx(
          () => CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: TaxText.secText('لا : ضع صفرا'),
            value: controller.checkboxValues[1],
            activeColor: AppTheme.lightAppColors.primary,
            onChanged: (bool? value) {
              controller.updateCheckboxState(1);
            },
          ),
        ),
      ],
    );
  }

  Row taxFormIcon(
    context,
    title,
    height,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    clipBehavior: Clip.hardEdge,
                    backgroundColor: AppTheme.lightAppColors.background,
                    child: Container(
                        padding: const EdgeInsets.all(12),
                        width: context.screenWidth,
                        decoration: BoxDecoration(
                          color: AppTheme.lightAppColors.background,
                        ),
                        height: height,
                        child: Column(
                          children: [
                            TaxText.dialogText(title),
                            const Spacer(),
                            AppButton(
                                model: AppButtonModel(
                                    title: "اغلاق",
                                    onTap: () {
                                      Get.back();
                                    }))
                          ],
                        )),
                  );
                });
          },
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                color: AppTheme.lightAppColors.iconcolor,
                shape: BoxShape.circle),
            child: Icon(
              Icons.question_mark_outlined,
              size: 20,
              color: AppTheme.lightAppColors.background,
            ),
          ),
        ),
      ],
    );
  }
}
