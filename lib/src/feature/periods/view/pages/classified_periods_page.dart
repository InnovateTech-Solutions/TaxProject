import 'package:flutter/material.dart';
import 'package:tax_project/src/feature/periods/view/widget/main_widget/classified_periods_widget.dart';

class ClassifiedPeriodsPage extends StatelessWidget {
  const ClassifiedPeriodsPage(
      {super.key, required this.periods, required this.year});
  final String periods;
  final String year;
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
            child: ClassifiedPeriodsWidget(
              periods: periods,
              year: year,
            )),
      ),
    );
  }
}
