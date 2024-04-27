import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/feature/register/controller/register_controller.dart';
import 'package:tax_project/src/feature/register/model/form_model.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/register_form.dart';

class SecRegisterWidget extends StatelessWidget {
  const SecRegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      FormWidget(
        formModel: FormModel(
          controller: controller.postalCode,
          enableText: false,
          hintText: "الرمز البريدي",
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
          controller: controller.taxNumber,
          enableText: false,
          hintText: "رقم الضريبي",
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
          controller: controller.ibanNumber,
          enableText: false,
          hintText: "رقم IBAN الخاص بالمكلف",
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
          controller: controller.email,
          enableText: false,
          hintText: "البريد الالكتروني",
          invisible: false,
          validator: null,
          type: TextInputType.name,
          inputFormat: null,
        ),
      ),
    ]);
  }
}
