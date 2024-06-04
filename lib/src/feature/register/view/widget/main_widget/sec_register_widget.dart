import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/feature/register/controller/register_controller.dart';
import 'package:tax_project/src/feature/register/model/form_model.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/register_cities.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/register_country.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/register_form.dart';

class SecRegisterWidget extends StatelessWidget {
  const SecRegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CityDropdownWidget(
        formModel: FormModel(
          hintText: 'اختر مدينة',
          enableText: false,
          inputFormat: [],
          type: TextInputType.text,
          validator: null,
          invisible: false,
          controller: controller.governorate,
        ),
        onTap: () {
          print('City selected');
        },
      ),
      SizedBox(
        height: context.screenHeight * 0.06,
      ),
      CountryDropdownWidget(
        formModel: FormModel(
          hintText: 'اختر دولة',
          enableText: false,
          inputFormat: [],
          type: TextInputType.text,
          validator: null,
          invisible: false,
          controller: controller.country,
        ),
        onTap: () {
          print('Country selected');
        },
      ),
      SizedBox(
        height: context.screenHeight * 0.06,
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
