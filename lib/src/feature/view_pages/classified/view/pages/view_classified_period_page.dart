import 'package:flutter/material.dart';
import 'package:tax_project/src/feature/view_pages/classified/view/widget/view_classified_period.dart';

import '../../../../../config/themes/background.dart';

class ViewClassifiedPeriodsPage extends StatelessWidget {
  const ViewClassifiedPeriodsPage(
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
              ViewClassifiedPeriodsWidget(
                periods: periods,
                year: year,
                view: view,
              ),
              context)),
    );
  }
}
