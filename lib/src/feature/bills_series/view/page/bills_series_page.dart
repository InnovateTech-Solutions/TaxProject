import 'package:flutter/material.dart';
import 'package:tax_project/src/feature/bills_series/view/widget/main_widget/bills_series_widget.dart';

class BillSeriesPage extends StatelessWidget {
  const BillSeriesPage({super.key, required this.periods, required this.year});
  final String periods;
  final String year;
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: BillSeriesWidget(),
      ),
    );
  }
}
