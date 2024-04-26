import 'package:flutter/material.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';

backgroundColor(Widget widget, BuildContext context) {
  return Container(
      height: context.screenHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffffffff),
            Color(0xffA1BFE1),
          ],
        ),
      ),
      child: widget);
}
