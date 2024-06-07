import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/bill/controller/bill_controller.dart';
import 'package:tax_project/src/feature/bill/view/page/bill_form_page.dart';
import 'package:tax_project/src/feature/bill/view/widget/collection_widgets/bill_pop_dialog.dart';
import 'package:tax_project/src/feature/periods/view/widget/text_widget/period_text.dart';
import 'package:tax_project/src/feature/register/view/widget/text_widget/register_text.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/app_button.dart';

class BillImgWiget extends StatelessWidget {
  const BillImgWiget(
      {super.key,
      required this.periods,
      required this.year,
      required this.equation,
      required this.category});
  final String periods;
  final String year;
  final double equation;

  final String category;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BbillController());
    return Container(
      margin: const EdgeInsets.all(
        15,
      ),
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
          Row(
            children: [
              SizedBox(
                width: context.screenWidth * 0.055,
              ),
              PeriodText.secText("ادخل فاتورة واحدة في كل مرة"),
            ],
          ),
          //img text
          SizedBox(
            height: context.screenHeight * 0.05,
          ),
          GestureDetector(
            onTap: () {
              showPopupButtons(context);
            },
            child: Container(
              width: context.screenWidth * .9,
              height: context.screenHeight * .5,
              decoration: BoxDecoration(
                  color: AppTheme.lightAppColors.background.withOpacity(.5),
                  borderRadius: BorderRadius.circular(15)),
              child: Obx(() {
                final image = controller.image.value;
                return image != null
                    ? Image.file(
                        image,
                        fit: BoxFit.cover,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/img/Paper Upload.png"),
                          RegisterText.thirdIconText("أنقر لاختيار صورة")
                        ],
                      );
              }),
            ),
          ),
          SizedBox(
            height: context.screenHeight * .01,
          ),
          //add button
          SizedBox(
              width: context.screenWidth,
              child: AppButton(
                  model: AppButtonModel(
                      title: "تحميل فاتورة",
                      onTap: () {
                        if (controller.image.value == null) {
                          Get.snackbar('خطأ', "اختر صورة",
                              colorText: AppTheme.lightAppColors.background,
                              backgroundColor: Colors.red);
                        } else {
                          controller.addImg();
                          Get.to(BillFormPage(
                            periods: periods,
                            year: year,
                            img: controller.image.value.toString(),
                            category: category,
                            equation: equation,
                          ));
                        }
                      })))
        ],
      ),
    );
  }
}
