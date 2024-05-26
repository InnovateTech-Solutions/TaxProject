import 'package:flutter/material.dart';
import 'package:tax_project/src/config/themes/theme.dart';

class RegisterText {
  static mainText(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w900,
        fontFamily: 'Poppins-Bold',
      ),
    );
  }

  static secText(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        color: AppTheme.lightAppColors.mainTextcolor,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins-SemiBold',
      ),
    );
  }

  static iconText(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        color: AppTheme.lightAppColors.iconcolor,
        fontFamily: 'Poppins-Medium',
      ),
    );
  }

  static secIconText(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        color: AppTheme.lightAppColors.subTextcolor,
        fontFamily: 'Poppins-Mdeuim',
      ),
    );
  }
}
