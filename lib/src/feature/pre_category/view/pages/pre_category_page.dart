import 'package:flutter/material.dart';
import 'package:tax_project/src/feature/pre_category/view/widget/main/pre_category_widget.dart';

class PreCategoryPage extends StatelessWidget {
  const PreCategoryPage(
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
    return SafeArea(
        child: Scaffold(
      body: PreCategoryWidget(
        view: view,
        periods: periods,
        year: year,
        taxPeriod: taxPeriod,
      ),
    ));
  }
}
