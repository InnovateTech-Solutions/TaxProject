import 'package:flutter/material.dart';
import 'package:tax_project/src/config/themes/background.dart';
import 'package:tax_project/src/feature/register/view/widget/main_widget/sec_register_widget.dart';

class SecRegisterPage extends StatelessWidget {
  const SecRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: backgroundColor(const SecRegisterWidget(), context)));
  }
}
