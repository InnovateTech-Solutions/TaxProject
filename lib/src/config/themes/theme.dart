import 'package:flutter/material.dart';
import 'package:tax_project/src/config/themes/app_extension.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
    extensions: [
      lightAppColors,
    ],
  );

  static final lightAppColors = AppColorsExtension(
    primary: const Color(0xff161E21),
    background: const Color(0xffFFFFFF),
    buttoncolor: const Color(0xffCA9703),
    bordercolor: const Color(0xffD9D9D9),
    subTextcolor: const Color(0xffffffff),
    mainTextcolor: const Color(0xff000000),
    formTextColor: const Color(0xffA1A8B0),
  );
}
