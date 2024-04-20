import 'package:flutter/material.dart';
import 'package:tax_project/src/feature/register/view/widget/main_widget/sec_register_widget.dart';

class SecRegisterPage extends StatelessWidget {
  const SecRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffffffff),
                  Color(0xffffffff),
                  Color(0xffA1BFE1),
                ],
              ),
            ),
            child: const SecRegisterWidget()),
      ),
    );
  }
}
