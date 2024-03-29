import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension(
      {required this.primary,
      required this.background,
      required this.buttoncolor,
      required this.iconcolor,
      required this.mainTextcolor,
      required this.formTextColor,
      required this.subTextcolor});

  final Color primary;
  final Color background;
  final Color buttoncolor;
  final Color iconcolor;
  final Color formTextColor;
  final Color subTextcolor;
  final Color mainTextcolor;

  @override
  ThemeExtension<AppColorsExtension> copyWith(
      {Color? primary,
      Color? background,
      Color? buttoncolor,
      Color? formTextColor,
      Color? iconcolor,
      Color? subTextcolor,
      Color? mainTextcolor}) {
    return AppColorsExtension(
        primary: primary ?? this.primary,
        background: background ?? this.background,
        formTextColor: formTextColor ?? this.formTextColor,
        buttoncolor: buttoncolor ?? this.buttoncolor,
        iconcolor: iconcolor ?? this.iconcolor,
        subTextcolor: subTextcolor ?? this.subTextcolor,
        mainTextcolor: mainTextcolor ?? this.mainTextcolor);
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      background: Color.lerp(background, other.background, t)!,
      formTextColor: Color.lerp(formTextColor, other.formTextColor, t)!,
      buttoncolor: Color.lerp(buttoncolor, other.buttoncolor, t)!,
      iconcolor: Color.lerp(iconcolor, other.iconcolor, t)!,
      mainTextcolor: Color.lerp(mainTextcolor, other.mainTextcolor, t)!,
      subTextcolor: Color.lerp(subTextcolor, other.subTextcolor, t)!,
    );
  }
}
