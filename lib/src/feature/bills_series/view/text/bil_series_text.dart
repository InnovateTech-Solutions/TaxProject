import 'package:flutter/material.dart';

class BillSeriesText {
  static mainText(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins-Bold',
      ),
    );
  }

  static secText(String title) {
    return Text(
      title,
      textAlign: TextAlign.start,
      style: const TextStyle(
        fontSize: 20,
        fontFamily: 'Poppins-Bold',
      ),
    );
  }
}
