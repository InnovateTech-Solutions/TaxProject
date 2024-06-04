import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/splash_screen/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      title: 'Tax Project',
      theme: AppTheme.light,
      home: const SplashPage(),
    );
  }
}
