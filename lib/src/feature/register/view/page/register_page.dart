import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tax_project/src/config/themes/background.dart';
import 'package:tax_project/src/feature/register/controller/register_controller.dart';
import 'package:tax_project/src/feature/register/view/widget/main_widget/register_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final controller = Get.put(RegisterController());
  @override
  void initState() {
    controller.isFirst.value = false;
    saveIsFirstFalse();
    super.initState();
  }

  Future<void> saveIsFirstFalse() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirst', false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: backgroundColor(const RegisterWidget(), context),
      ),
    );
  }
}
