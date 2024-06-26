import 'package:flutter/material.dart';
import 'package:tax_project/src/config/themes/app_extension.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
    extensions: [
      lightAppColors,
    ],
  );

  static final lightAppColors = AppColorsExtension(
    primary: const Color(0xff265999),
    background: const Color(0xffFFFFFF),
    buttoncolor: const Color(0xff161E21),
    iconcolor: const Color(0xffC8992F),
    subTextcolor: const Color(0xffffffff),
    mainTextcolor: const Color(0xff000000),
    formTextColor: const Color.fromARGB(255, 203, 205, 208),
  );
}
