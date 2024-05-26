import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillSeriesController extends GetxController {
  var controllers = <Map<String, TextEditingController>>[].obs;

  @override
  void onInit() {
    super.onInit();
    addRow(); // Add the initial row
  }

  void addRow() {
    controllers.add({
      "from": TextEditingController(),
      "to": TextEditingController(),
    });
  }

  @override
  void onClose() {
    // Dispose of all controllers when the controller is disposed
    for (var controllerPair in controllers) {
      controllerPair["from"]!.dispose();
      controllerPair["to"]!.dispose();
    }
    super.onClose();
  }
}
