import 'package:flutter/material.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: context.screenHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffffffff),
            Color(0xffffffff),
            Color(0xff265999),
          ],
        ),
      ),
      child: Form(
        child: Column(children: []),
      ),
    );
  }
}
