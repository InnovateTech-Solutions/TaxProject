import 'package:flutter/material.dart';
import 'package:tax_project/src/feature/register/view/widget/main_widget/register_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: RegisterWidget(),
      ),
    );
  }
}
