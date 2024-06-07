import 'package:flutter/material.dart';
import 'package:tax_project/src/config/themes/background.dart';
import 'package:tax_project/src/feature/bill/view/widget/main_widget/bill_img_widget.dart';

class BillImgPage extends StatelessWidget {
  const BillImgPage({
    super.key,
    required this.periods,
    this.percentageValue,
    required this.year,
    required this.equation,
    required this.category,
    required this.taxPeriod,
    required this.categoryId,
  });
  final int categoryId;

  final String taxPeriod;
  final String periods;
  final String year;
  final double? percentageValue;
  final double equation;
  final String category;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: backgroundColor(
              BillImgWiget(
                periods: periods,
                year: year,
                category: category,
                equation: equation,
                taxPeriod: taxPeriod,
                categoryId: categoryId,
              ),
              context)),
    );
  }
}
