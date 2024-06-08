import 'package:flutter/material.dart';
import 'package:tax_project/src/feature/periods/view/widget/main_widget/classified_periods_widget.dart';

import '../../../../config/themes/background.dart';

class ClassifiedPeriodsPage extends StatelessWidget {
  const ClassifiedPeriodsPage(
      {super.key,
      required this.periods,
      required this.year,
      required this.view});
  final String view;
  final String periods;
  final String year;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: backgroundColor(
              ClassifiedPeriodsWidget(
                periods: periods,
                year: year,
                view: view,
              ),
              context)),
    );
  }
}
