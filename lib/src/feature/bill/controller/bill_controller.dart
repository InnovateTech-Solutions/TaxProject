import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tax_project/src/feature/category/model/category_model.dart';

class BillController extends GetxController {
  RxList<File> billImgs = <File>[].obs;
  RxList<Bill> bills = <Bill>[].obs;
  final picker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  Rx<File?> image = Rx<File?>(null);
  Rx total = 0.obs;

  validation(String value) {
    if (value.isEmpty) {
      return "يرجى ملء الحقل";
    } else {
      return null;
    }
  }

  TextEditingController billImg = TextEditingController();
  TextEditingController billValue = TextEditingController();
  TextEditingController billNumber = TextEditingController();
  TextEditingController billDate = TextEditingController();

  Future<void> pickImages() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
    print(image.value);
  }

  Future<void> takeImages() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
    print(image.value);
  }

  Future<void> addImg() async {
    if (image.value != null) {}
    print(image.value);
  }

  Future<void> addBill() async {
    Bill bill = Bill(
        id: 2,
        img: billImg.text,
        billNumber: int.parse(billNumber.text),
        billValue: int.parse(billValue.text));
    bills.add(bill);
  }

  Future<void> totalBill() async {
    for (var bill in bills) {
      total.value = bill.billValue++;
    }
  }
}
