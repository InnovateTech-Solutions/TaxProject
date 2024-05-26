import 'package:flutter/material.dart';
import 'package:tax_project/src/config/themes/background.dart';
import 'package:tax_project/src/feature/bills_series/view/widget/main_widget/bills_series_widget.dart';

class BillSeriesPage extends StatelessWidget {
  const BillSeriesPage({super.key, required this.periods, required this.year});
  final String periods;
  final String year;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: backgroundColor(const BillSeriesWidget(), context),
      ),
    );
  }
}
