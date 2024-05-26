import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaxCalculationController extends GetxController {
  TextEditingController field1 = TextEditingController();
  TextEditingController field2 = TextEditingController();
  TextEditingController field3 = TextEditingController();
  TextEditingController field4 = TextEditingController();
  TextEditingController field5 = TextEditingController();

  RxList<bool> checkboxValues = [false, true].obs;
  void updateCheckboxState(int index) {
    for (int i = 0; i < checkboxValues.length; i++) {
      checkboxValues[i] = i == index;
    }
  }
}
