import 'package:flutter/material.dart';

class TaxText {
  static mainText(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 22,
        fontFamily: 'Poppins-Bold',
      ),
    );
  }

  static secText(String title) {
    return Text(
      title,
      textAlign: TextAlign.start,
      style: const TextStyle(
        fontSize: 17,
        fontFamily: 'Poppins-Bold',
      ),
    );
  }

  static dialogText(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 22,
        fontFamily: 'Poppins-Bold',
      ),
    );
  }
}
