import 'package:flutter/material.dart';
import 'package:tax_project/src/config/themes/theme.dart';

class PeriodText {
  static mainText(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w800,
        fontFamily: 'Poppins-Bold',
      ),
    );
  }

  static secText(String title) {
    return Text(
      title,
      textAlign: TextAlign.start,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w900,
        fontFamily: 'Poppins-Bold',
      ),
    );
  }

  static buttonText(String title) {
    return Text(
      title,
      style: TextStyle(color: AppTheme.lightAppColors.background, fontSize: 20),
    );
  }
}
