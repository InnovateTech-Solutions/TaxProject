import 'package:flutter/material.dart';
import 'package:tax_project/src/config/themes/background.dart';
import 'package:tax_project/src/feature/pre_category/view/widget/main/pre_category_widget.dart';

class PreCategoryPage extends StatelessWidget {
  const PreCategoryPage({super.key, required this.periods, required this.year});
  final String periods;
  final String year;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: backgroundColor(
          PreCategoryWidget(
            periods: periods,
            year: year,
          ),
          context),
    ));
  }
}
