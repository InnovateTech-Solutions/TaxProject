import 'package:flutter/material.dart';
import 'package:tax_project/src/config/themes/background.dart';
import 'package:tax_project/src/feature/tax_calculation/view/collection/tax_calculation_widget.dart';

class TaxCalculationPage extends StatelessWidget {
  const TaxCalculationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: backgroundColor(const TaxCalculationWidget(), context),
      ),
    );
  }
}
