import 'package:flutter/material.dart';
import 'package:tax_project/src/config/themes/background.dart';
import 'package:tax_project/src/feature/view_pages/category/view/widget/view_category_widget.dart';

class ViewCategoryPage extends StatelessWidget {
  const ViewCategoryPage(
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
              ViewCategoeyWidget(
                view: view,
                periods: periods,
                year: year,
                taxPeriod: taxPeriod,
              ),
              context)),
    );
  }
}
