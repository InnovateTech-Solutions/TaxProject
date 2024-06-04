import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/bills_series/controller/bills_series_controller.dart';
import 'package:tax_project/src/feature/bills_series/view/text/bil_series_text.dart';
import 'package:tax_project/src/feature/register/model/form_model.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/register_form.dart';
import 'package:tax_project/src/feature/tax_calculation/view/text/tax_text.dart';

class BillSeriesWidget extends StatelessWidget {
  const BillSeriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final BillSeriesController controller = Get.put(BillSeriesController());

    return Container(
      // margin: const EdgeInsets.all(20),
      width: context.screenWidth,
      height: context.screenHeight * 0.9,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      TaxText.thirdText(" تسلسل ارقام فواتير المبيعات"),
                    ],
                  ),
                ),
              ],
            ),
            Obx(
              () => Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.controllers.map((controllerPair) {
                    return Row(
                      children: [
                        BillSeriesText.secText("من"),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: context.screenWidth * 0.3,
                          child: FormWidget(
                            formModel: FormModel(
                              controller: controllerPair["from"]!,
                              enableText: false,
                              hintText: "",
                              invisible: false,
                              validator: null,
                              type: TextInputType.number,
                              inputFormat: null,
                            ),
                          ),
                        ),
                        BillSeriesText.secText("الى"),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: context.screenWidth * 0.3,
                          height: context.screenHeight * 0.09,
                          child: FormWidget(
                            formModel: FormModel(
                              controller: controllerPair["to"]!,
                              enableText: false,
                              hintText: "",
                              invisible: false,
                              validator: null,
                              type: TextInputType.number,
                              inputFormat: null,
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.addRow();
              },
              child: Container(
                  margin: const EdgeInsets.only(right: 30),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      color: const Color(0xffA1BFE1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    Icons.add,
                    color: AppTheme.lightAppColors.background,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
