import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/bills_series/controller/bills_series_controller.dart';
import 'package:tax_project/src/feature/bills_series/view/text/bil_series_text.dart';
import 'package:tax_project/src/feature/register/model/form_model.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/register_form.dart';

class BillSeriesWidget extends StatelessWidget {
  const BillSeriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final BillSeriesController controller = Get.put(BillSeriesController());

    return Container(
      margin: const EdgeInsets.all(20),
      width: context.screenWidth,
      height: context.screenHeight * 0.9,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BillSeriesText.mainText(" تسلسل ارقام فواتير المبيعات"),
            Obx(
              () => Column(
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
            GestureDetector(
              onTap: () {
                controller.addRow();
              },
              child: Container(
                  margin: EdgeInsets.only(right: 30),
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
                      color: Color(0xffA1BFE1),
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
