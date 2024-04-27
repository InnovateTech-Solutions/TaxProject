import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/feature/register/controller/register_controller.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/register_form.dart';

import '../../../model/form_model.dart';

class FirstRegiterWidget extends StatelessWidget {
  const FirstRegiterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      FormWidget(
        formModel: FormModel(
          controller: controller.name,
          enableText: false,
          hintText: "اسم المسجل",
          invisible: false,
          validator: null,
          type: TextInputType.name,
          inputFormat: null,
        ),
      ),
      SizedBox(
        height: context.screenHeight * 0.03,
      ),
      FormWidget(
        formModel: FormModel(
          controller: controller.phoneNumber,
          enableText: false,
          hintText: "رقم الهاتف",
          invisible: false,
          validator: null,
          type: TextInputType.phone,
          inputFormat: null,
        ),
      ),
      SizedBox(
        height: context.screenHeight * 0.03,
      ),
      FormWidget(
        formModel: FormModel(
          controller: controller.cellNumber,
          enableText: false,
          hintText: "رقم الخلوي",
          invisible: false,
          validator: null,
          type: TextInputType.number,
          inputFormat: null,
        ),
      ),
      SizedBox(
        height: context.screenHeight * 0.03,
      ),
      FormWidget(
        formModel: FormModel(
          controller: controller.country,
          enableText: false,
          hintText: "البلد",
          invisible: false,
          validator: null,
          type: TextInputType.name,
          inputFormat: null,
        ),
      ),
      SizedBox(
        height: context.screenHeight * 0.03,
      ),
      FormWidget(
        formModel: FormModel(
          controller: controller.country,
          enableText: false,
          hintText: "المحافظة",
          invisible: false,
          validator: null,
          type: TextInputType.name,
          inputFormat: null,
        ),
      )
    ]);
  }
}
