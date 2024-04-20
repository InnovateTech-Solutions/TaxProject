import 'package:flutter/material.dart';
import 'package:tax_project/src/feature/dashboard/view/widget/main_widget/dashboard_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
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
                  Color(0xffffffff),
                  Color(0xffA1BFE1),
                ],
              ),
            ),
            child: const DashboardWidget()),
      ),
    );
  }
}
