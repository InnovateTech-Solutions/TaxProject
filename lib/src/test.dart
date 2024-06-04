import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/database/test_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: UserView(),
    );
  }
}
