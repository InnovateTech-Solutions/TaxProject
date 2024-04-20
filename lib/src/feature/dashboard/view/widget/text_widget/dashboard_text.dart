import 'package:flutter/material.dart';

class DashboardText {
  static fileTextLarge(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w900,
        fontFamily: 'Poppins-Bold',
      ),
    );
  }

  static fileTextSmall(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w900,
        fontFamily: 'Poppins-Bold',
      ),
    );
  }
}
