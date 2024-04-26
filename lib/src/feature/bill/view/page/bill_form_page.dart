import 'package:flutter/material.dart';
import 'package:tax_project/src/config/themes/background.dart';
import 'package:tax_project/src/feature/bill/view/widget/main_widget/bill_form_widget.dart';

class BillFormPage extends StatelessWidget {
  const BillFormPage(
      {super.key,
      required this.periods,
      required this.year,
      required this.img,
      required this.category});
  final String periods;
  final String year;
  final String img;
  final String category;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: backgroundColor(
            BillFormWidget(
                periods: periods, year: year, img: img, category: category),
            context),
      ),
    );
  }
}
