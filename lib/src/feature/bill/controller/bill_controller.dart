import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BillController extends GetxController {
  RxList<File> billImgs = <File>[].obs;
  final picker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  Rx<File?> image = Rx<File?>(null);

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
    if (image.value != null) {
      billImgs.add(File(image.value.toString()));
    }
    print(image.value);
  }
}
