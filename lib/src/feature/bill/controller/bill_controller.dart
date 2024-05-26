import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tax_project/src/feature/category/model/category_model.dart';

class BillController extends GetxController {
  RxList<File> billImgs = <File>[].obs;
  RxList<Bill> bills = <Bill>[].obs;
  RxList<CategoryModel> category = <CategoryModel>[].obs;
  RxList<TaxModel> tax = <TaxModel>[].obs;

  final picker = ImagePicker();
  Rx<File?> image = Rx<File?>(null);
  RxDouble total = 0.0.obs;
  RxDouble taxVlaue = 0.0.obs;

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
  }

  Future<void> takeImages() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  Future<void> addImg() async {
    if (image.value != null) {}
  }

  Future<void> taxValueForBill(double equation) async {
    taxVlaue.value = double.tryParse(billValue.text)! * (equation);
  }

  Future<void> addBill(String type, year) async {
    Bill bill = Bill(
      id: 2,
      img: image.value,
      billNumber: int.parse(billNumber.text),
      billValue: int.parse(billValue.text),
      billDate: billDate.text,
      type: type,
      year: year,
    );
    bills.add(bill);
    image.value = null; // Reset the image after adding the bill

    // image.value != null;
  }

  Future<void> addCategory(CategoryModel cat) async {
    category.add(cat);
  }

  Future<void> totalBill() async {
    double sum = 0;
    for (var bill in bills) {
      sum += bill.billValue;
    }
    total.value = sum;
  }
}
