import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/bill/controller/bill_controller.dart';
import 'package:tax_project/src/feature/bill/view/page/bill_page.dart';
import 'package:tax_project/src/feature/register/model/form_model.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/app_button.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/register_form.dart';

class BillFormWidget extends StatefulWidget {
  const BillFormWidget(
      {super.key,
      required this.periods,
      required this.year,
      required this.img,
      required this.category});
  final String periods;
  final String year;
  final String img;
  final String category;

  @override
  State<BillFormWidget> createState() => _BillFormWidgetState();
}

class _BillFormWidgetState extends State<BillFormWidget> {
  final controller = Get.put(BillController());
  void clearText() {
    controller.billImg.clear();
    controller.billDate.clear();
    controller.billNumber.clear();
    controller.billValue.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
        key: controller.formKey,
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
            const Text(
              "صورة الفاتورة",
              style: TextStyle(
                fontFamily: 'Poppins-Bold',
                fontSize: 20,
              ),
            ),
            FormWidget(
              formModel: FormModel(
                controller: controller.billImg,
                enableText: true,
                hintText: widget.img,
                invisible: false,
                validator: (value) => controller.validation(value!),
                type: TextInputType.name,
                inputFormat: null,
              ),
            ),
            SizedBox(
              height: context.screenHeight * .03,
            ),
            const Text(
              "قيمة الفاتورة",
              style: TextStyle(
                fontFamily: 'Poppins-Bold',
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: context.screenHeight * .01,
            ),
            FormWidget(
              formModel: FormModel(
                controller: controller.billValue,
                enableText: false,
                hintText: "قيمة الفاتورة",
                invisible: false,
                validator: (value) => controller.validation(value!),
                type: TextInputType.name,
                inputFormat: null,
              ),
            ),
            SizedBox(
              height: context.screenHeight * .03,
            ),
            const Text(
              "رقم الفاتورة",
              style: TextStyle(
                fontFamily: 'Poppins-Bold',
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: context.screenHeight * .01,
            ),
            FormWidget(
              formModel: FormModel(
                controller: controller.billNumber,
                enableText: false,
                hintText: "رقم الفاتورة",
                invisible: false,
                validator: (value) => controller.validation(value!),
                type: TextInputType.name,
                inputFormat: null,
              ),
            ),
            SizedBox(
              height: context.screenHeight * .03,
            ),
            const Text(
              "تاريخ الفاتورة",
              style: TextStyle(
                fontFamily: 'Poppins-Bold',
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: context.screenHeight * .01,
            ),
            Stack(
              children: [
                FormWidget(
                  formModel: FormModel(
                    controller: controller.billDate,
                    enableText: true,
                    hintText: "تاريخ الفاتورة",
                    invisible: false,
                    validator: (value) => controller.validation(value!),
                    type: TextInputType.name,
                    inputFormat: [],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2015, 8),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null) {
                      controller.billDate.text =
                          "${picked.day.toString()}/${picked.month.toString()}/${picked.year.toString()}";
                    }
                  },
                  child: Container(
                    color: Colors.transparent,
                    height: context.screenHeight * .08,
                    width: context.screenWidth,
                  ),
                )
              ],
            ),
            SizedBox(
              height: context.screenHeight * .05,
            ),
            AppButton(
                title: "التالي",
                onTap: () {
                  controller.addImg();
                  controller.addBill();
                  controller.totalBill();
                  Get.to(const BillPage());
                  clearText();
                })
          ],
        ),
      ),
    );
  }
}
