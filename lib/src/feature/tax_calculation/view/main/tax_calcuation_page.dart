import 'package:flutter/material.dart';
import 'package:tax_project/src/config/themes/background.dart';
import 'package:tax_project/src/feature/tax_calculation/view/collection/tax_calculation_widget.dart';

class TaxCalculationPage extends StatelessWidget {
  const TaxCalculationPage(
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
        body: backgroundColor(
            TaxCalculationWidget(
              view: view,
              periods: periods,
              year: year,
              taxPeriod: taxPeriod,
            ),
            context),
      ),
    );
  }
}
