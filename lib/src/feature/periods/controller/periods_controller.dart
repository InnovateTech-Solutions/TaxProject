import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PeriodsController extends GetxController {
  final yearController = TextEditingController();
  String? yearValidate(String year) {
    int enteredYear = int.tryParse(year) ?? 0;
    if (enteredYear > DateTime.now().year) {
      return 'السنة المدخلة أكبر من السنة الحالية';
    } else if (year.isEmpty) {
      return 'الرجاء ادخال السنة للاقرار';
    } else if (enteredYear < 2022) {
      return 'السنة المدخلة غير صحيحة';
    } else {
      return null;
    }
  }

  List<String> oddList = [
    "من  1 - 1 الى  28  او  27 - 2  ",
    "من  1 - 3  الى  30 - 4",
    "من  1 - 5  الى  30 - 6",
    "من  1 - 7  الى  31 - 8",
    "من  1 - 9  الى  31 - 10",
    "من  1 - 11  الى  31 - 12"
  ];
  List<String> evenList = [
    "من  1 - 2  الى  31 - 3",
    "من  1 - 4  الى  31 - 5",
    "من  1 - 6  الى  31 - 7",
    "من  1 - 8  الى  30 - 9",
    "من  1 - 10  الى  30 - 11",
    "من  1 - 12  الى  31 - 1"
  ];
}
