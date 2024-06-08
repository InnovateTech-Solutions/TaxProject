import 'package:flutter/material.dart';
import 'package:tax_project/src/config/themes/background.dart';
import 'package:tax_project/src/feature/category/view/widget/main_widget/category_widget.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage(
      {super.key,
      required this.periods,
      required this.year,
      required this.taxPeriod,
      required this.view});
  final String view;
  final String taxPeriod;
  final String periods;
  final String year;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: backgroundColor(
              CategoeyWidget(
                view: view,
                periods: periods,
                year: year,
                taxPeriod: taxPeriod,
              ),
              context)),
    );
  }
}
