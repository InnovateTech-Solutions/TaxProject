import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/dashboard/view/pages/dashboard_page.dart';

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
      home: const DashboardPage(),
    );
  }
}
