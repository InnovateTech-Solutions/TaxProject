import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final cellNumber = TextEditingController();
  final country = TextEditingController();
  final governorate = TextEditingController();
  final taxNumber = TextEditingController();
  final email = TextEditingController();
  final PageController pageController = PageController();
  final RxInt currentPageIndex = 0.obs;
  RxBool color = false.obs;
  RxBool isFirst = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  double get progress => currentPageIndex.value / 2;

  @override
  void onInit() {
    super.onInit();
    loadFormData();
  }

  void nextPage() {
    if (currentPageIndex.value < 1) {
      if (formKey.currentState!.validate()) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
    } else {}
  }

  Color getIconColor(int currentIndex) {
    if (currentIndex == 0) {
      return const Color(0xffffffff);
    } else {
      return const Color(0xffCA9703);
    }
  }

  Future<void> saveFormData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name.text);
    await prefs.setString('phoneNumber', phoneNumber.text);
    await prefs.setString('cellNumber', cellNumber.text);
    await prefs.setString('country', country.text);
    await prefs.setString('governorate', governorate.text);
    await prefs.setString('taxNumber', taxNumber.text);
    await prefs.setString('email', email.text);
  }

  Future<void> loadFormData() async {
    final prefs = await SharedPreferences.getInstance();
    name.text = prefs.getString('name') ?? '';
    phoneNumber.text = prefs.getString('phoneNumber') ?? '';
    cellNumber.text = prefs.getString('cellNumber') ?? '';
    country.text = prefs.getString('country') ?? '';
    governorate.text = prefs.getString('governorate') ?? '';
    taxNumber.text = prefs.getString('taxNumber') ?? '';
    email.text = prefs.getString('email') ?? '';
  }

  validation(String value) {
    if (value.isEmpty) {
      return "يرجى ملء الحقل";
    } else {
      return null;
    }
  }

  final List<String> cities = [
    'عمّان (العاصمة)',
    'إربد',
    'الزرقاء',
    'المفرق',
    'عجلون',
    'جرش',
    'مادبا',
    'البلقاء',
    'الكرك',
    'الطفيلة',
    'معان',
    'العقبة',
  ];
}
