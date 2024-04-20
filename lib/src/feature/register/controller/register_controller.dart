import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final cellNumber = TextEditingController();
  final country = TextEditingController();
  final governorate = TextEditingController();
  final postalCode = TextEditingController();
  final taxNumber = TextEditingController();
  final ibanNumber = TextEditingController();
  final email = TextEditingController();
  final PageController pageController = PageController();
  final RxInt currentPageIndex = 0.obs;
  RxBool color = false.obs;

  double get progress => currentPageIndex.value / 2;

  void nextPage() {
    if (currentPageIndex.value < 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {}
  }

  Color getIconColor(int currentIndex) {
    if (currentIndex == 0) {
      return const Color(0xffffffff);
    } else {
      return const Color(0xffCA9703);
    }
  }
}
