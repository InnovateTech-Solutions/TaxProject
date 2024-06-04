import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/other/controller/other_controller.dart';
import 'package:tax_project/src/feature/other/view/collection/other_image.dart';
import 'package:tax_project/src/feature/register/model/form_model.dart';
import 'package:tax_project/src/feature/register/view/widget/text_widget/register_text.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/register_form.dart';

class OtherWidget extends StatelessWidget {
  const OtherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OtherController());
    return Container(
      margin: EdgeInsets.all(20),
      width: context.screenWidth,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
              height: context.screenHeight * 0.03,
            ),
            RegisterText.mainText("كشف حساب البنك"),
            Obx(
              () => Stack(
                children: [
                  FormWidget(
                      formModel: FormModel(
                          controller: controller.bankController,
                          enableText: false,
                          hintText: "كشف حساب البنك",
                          invisible: false,
                          validator: null,
                          type: TextInputType.number,
                          inputFormat: [])),
                  Positioned(
                    top: 10,
                    left: 12,
                    child: IconButton(
                        onPressed: () {
                          otherImageDialog(context, controller.bankImage);
                        },
                        icon: Icon(
                          controller.bankImage.value == null
                              ? Icons.camera_alt
                              : Icons.check,
                          color: controller.bankImage.value == null
                              ? AppTheme.lightAppColors.iconcolor
                              : Colors.green,
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.03,
            ),
            RegisterText.mainText("كشف حساب الصندوق"),
            Obx(
              () => Stack(
                children: [
                  FormWidget(
                      formModel: FormModel(
                          controller: controller.boxController,
                          enableText: false,
                          hintText: "كشف حساب البنك",
                          invisible: false,
                          validator: null,
                          type: TextInputType.number,
                          inputFormat: [])),
                  Positioned(
                    top: 10,
                    left: 12,
                    child: IconButton(
                        onPressed: () {
                          otherImageDialog(context, controller.boxImage);
                        },
                        icon: Icon(
                          controller.boxImage.value == null
                              ? Icons.camera_alt
                              : Icons.check,
                          color: controller.boxImage.value == null
                              ? AppTheme.lightAppColors.iconcolor
                              : Colors.green,
                        )),
                  )
                ],
              ),
            ),
            //
            SizedBox(
              height: context.screenHeight * 0.03,
            ),
            RegisterText.mainText("ميزان مراجعة"),
            Obx(
              () => Stack(
                children: [
                  FormWidget(
                      formModel: FormModel(
                          controller: controller.trialBalanceController,
                          enableText: false,
                          hintText: "كشف حساب البنك",
                          invisible: false,
                          validator: null,
                          type: TextInputType.number,
                          inputFormat: [])),
                  Positioned(
                    top: 10,
                    left: 12,
                    child: IconButton(
                        onPressed: () {
                          otherImageDialog(
                              context, controller.trialBalanceImage);
                        },
                        icon: Icon(
                          controller.trialBalanceImage.value == null
                              ? Icons.camera_alt
                              : Icons.check,
                          color: controller.trialBalanceImage.value == null
                              ? AppTheme.lightAppColors.iconcolor
                              : Colors.green,
                        )),
                  )
                ],
              ),
            ),

            SizedBox(
              height: context.screenHeight * 0.03,
            ),
            RegisterText.mainText("ميزان مراجعة"),
            Obx(
              () => Stack(
                children: [
                  FormWidget(
                      formModel: FormModel(
                          controller: controller.purchasinAnalysisController,
                          enableText: false,
                          hintText: "كشف حساب البنك",
                          invisible: false,
                          validator: null,
                          type: TextInputType.number,
                          inputFormat: [])),
                  Positioned(
                    top: 10,
                    left: 12,
                    child: IconButton(
                        onPressed: () {
                          otherImageDialog(
                              context, controller.purchasinAnalysisImage);
                        },
                        icon: Icon(
                          controller.purchasinAnalysisImage.value == null
                              ? Icons.camera_alt
                              : Icons.check,
                          color: controller.purchasinAnalysisImage.value == null
                              ? AppTheme.lightAppColors.iconcolor
                              : Colors.green,
                        )),
                  )
                ],
              ),
            ),

            SizedBox(
              height: context.screenHeight * 0.03,
            ),
            RegisterText.mainText("تحليل مبيعات"),
            Obx(
              () => Stack(
                children: [
                  FormWidget(
                      formModel: FormModel(
                          controller: controller.salesAnalysisController,
                          enableText: false,
                          hintText: "تحليل مبيعات",
                          invisible: false,
                          validator: null,
                          type: TextInputType.number,
                          inputFormat: [])),
                  Positioned(
                    top: 10,
                    left: 12,
                    child: IconButton(
                        onPressed: () {
                          otherImageDialog(
                              context, controller.salesAnalysisImage);
                        },
                        icon: Icon(
                          controller.salesAnalysisImage.value == null
                              ? Icons.camera_alt
                              : Icons.check,
                          color: controller.salesAnalysisImage.value == null
                              ? AppTheme.lightAppColors.iconcolor
                              : Colors.green,
                        )),
                  )
                ],
              ),
            ),

            SizedBox(
              height: context.screenHeight * 0.03,
            ),
            RegisterText.mainText("كشوفات جمركية واردة"),
            Obx(
              () => Stack(
                children: [
                  FormWidget(
                      formModel: FormModel(
                          controller: controller.incomingCustomsController,
                          enableText: false,
                          hintText: "كشوفات جمركية واردة",
                          invisible: false,
                          validator: null,
                          type: TextInputType.number,
                          inputFormat: [])),
                  Positioned(
                    top: 10,
                    left: 12,
                    child: IconButton(
                        onPressed: () {
                          otherImageDialog(
                              context, controller.incomingCustomsImage);
                        },
                        icon: Icon(
                          controller.incomingCustomsImage.value == null
                              ? Icons.camera_alt
                              : Icons.check,
                          color: controller.incomingCustomsImage.value == null
                              ? AppTheme.lightAppColors.iconcolor
                              : Colors.green,
                        )),
                  )
                ],
              ),
            ),

            SizedBox(
              height: context.screenHeight * 0.03,
            ),
            RegisterText.mainText("كشوفات جمركية صادرة"),
            Obx(
              () => Stack(
                children: [
                  FormWidget(
                      formModel: FormModel(
                          controller: controller.exportCustomsController,
                          enableText: false,
                          hintText: "كشوفات جمركية صادرة",
                          invisible: false,
                          validator: null,
                          type: TextInputType.number,
                          inputFormat: [])),
                  Positioned(
                    top: 10,
                    left: 12,
                    child: IconButton(
                        onPressed: () {
                          otherImageDialog(
                              context, controller.exportCustomsImage);
                        },
                        icon: Icon(
                          controller.exportCustomsImage.value == null
                              ? Icons.camera_alt
                              : Icons.check,
                          color: controller.exportCustomsImage.value == null
                              ? AppTheme.lightAppColors.iconcolor
                              : Colors.green,
                        )),
                  )
                ],
              ),
            ),

            SizedBox(
              height: context.screenHeight * 0.03,
            ),
            RegisterText.mainText(
              "كشوافات اخرى",
            ),
            Obx(
              () => Stack(
                children: [
                  FormWidget(
                      formModel: FormModel(
                          controller: controller.otherController,
                          enableText: false,
                          hintText: "كشوافات اخرى",
                          invisible: false,
                          validator: null,
                          type: TextInputType.number,
                          inputFormat: [])),
                  Positioned(
                    top: 10,
                    left: 12,
                    child: IconButton(
                        onPressed: () {
                          otherImageDialog(context, controller.otherImage);
                        },
                        icon: Icon(
                          controller.otherImage.value == null
                              ? Icons.camera_alt
                              : Icons.check,
                          color: controller.otherImage.value == null
                              ? AppTheme.lightAppColors.iconcolor
                              : Colors.green,
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
