import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/bill/controller/bill_controller.dart';
import 'package:tax_project/src/feature/register/model/form_model.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/register_form.dart';

class BillFormWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final controller = Get.put(BillController());
    return Container(
      margin: EdgeInsets.all(20),
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
            Text("صورة الفاتورة"),
            FormWidget(
              formModel: FormModel(
                  controller: controller.billImg,
                  enableText: true,
                  hintText: img,
                  invisible: false,
                  validator: null,
                  type: TextInputType.name,
                  inputFormat: null,
                  onTap: null),
            ),
            SizedBox(
              height: context.screenHeight * .05,
            ),
            FormWidget(
              formModel: FormModel(
                  controller: controller.billValue,
                  enableText: true,
                  hintText: img,
                  invisible: false,
                  validator: null,
                  type: TextInputType.name,
                  inputFormat: null,
                  onTap: null),
            ),
            SizedBox(
              height: context.screenHeight * .05,
            ),
            FormWidget(
              formModel: FormModel(
                  controller: controller.billNumber,
                  enableText: true,
                  hintText: img,
                  invisible: false,
                  validator: null,
                  type: TextInputType.name,
                  inputFormat: null,
                  onTap: null),
            ),
            SizedBox(
              height: context.screenHeight * .05,
            ),
            FormWidget(
              formModel: FormModel(
                  controller: controller.billDate,
                  enableText: true,
                  hintText: img,
                  invisible: false,
                  validator: null,
                  type: TextInputType.name,
                  inputFormat: null,
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2015, 8),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null) {
                      // Do something with the selected date, for example, update the form controller
                      controller.billDate.text = picked.toString();
                    }
                  }),
            ),
            SizedBox(
              height: context.screenHeight * .05,
            ),
          ],
        ),
      ),
    );
  }
}
