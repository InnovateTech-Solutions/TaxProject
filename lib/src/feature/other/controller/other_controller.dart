import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class OtherController extends GetxController {
  final picker = ImagePicker();
  Rx<File?> bankImage = Rx<File?>(null);
  Rx<File?> boxImage = Rx<File?>(null);
  Rx<File?> trialBalanceImage = Rx<File?>(null);
  Rx<File?> purchasinAnalysisImage = Rx<File?>(null);
  Rx<File?> salesAnalysisImage = Rx<File?>(null);
  Rx<File?> incomingCustomsImage = Rx<File?>(null);
  Rx<File?> exportCustomsImage = Rx<File?>(null);
  Rx<File?> otherImage = Rx<File?>(null);

  final bankController = TextEditingController();
  final boxController = TextEditingController();
  final trialBalanceController = TextEditingController();
  final purchasinAnalysisController = TextEditingController();
  final salesAnalysisController = TextEditingController();
  final incomingCustomsController = TextEditingController();
  final exportCustomsController = TextEditingController();
  final otherController = TextEditingController();

  Future<void> pickImages(Rx<File?> image) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  Future<void> takeImages(Rx<File?> image) async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }
}
