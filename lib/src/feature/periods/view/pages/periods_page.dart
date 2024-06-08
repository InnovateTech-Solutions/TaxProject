import 'package:flutter/material.dart';
import 'package:tax_project/src/feature/periods/view/widget/main_widget/periods_widget.dart';

class PeriodsPage extends StatelessWidget {
  const PeriodsPage({super.key, required this.view});
  final String view;
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
            child: PeriodsWidget(
              view: view,
            )),
      ),
    );
  }
}
