import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/background.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/dashboard/view/pages/dashboard_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(
        const DashboardPage(),
        transition: Transition.fade,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: backgroundColor(
          Column(
            children: [
              SizedBox(
                height: context.screenHeight * 0.1,
              ),
              Center(
                child: Image.asset("assets/img/splash_screen.png"),
              ),
              Spacer(),
              Row(
                children: [
                  SizedBox(
                    width: context.screenWidth * 0.05,
                  ),
                  Text(
                    "© All rights reserved ",
                    style: TextStyle(
                        color: AppTheme.lightAppColors.primary,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
            ],
          ),
          context),
    ));
  }
}
