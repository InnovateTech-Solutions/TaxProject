import 'package:flutter/material.dart';
import 'package:tax_project/src/feature/bill/view/widget/main_widget/bill_widget.dart';

class BillPage extends StatelessWidget {
  const BillPage({
    super.key,
    required this.year,
    required this.category,
    required this.equation,
    required this.periods,
    required this.taxPeriod,
    required this.categoryId,
  });
  final int categoryId;

  final String taxPeriod;
  final String year;
  final double equation;

  final String category;
  final String periods;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
            child: BillWidget(
              year: year,
              category: category,
              periods: periods,
              equation: equation,
              taxPeriod: taxPeriod,
              categoryId: categoryId,
            )),
      ),
    );
  }
}
