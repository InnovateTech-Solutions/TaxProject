import 'package:flutter/material.dart';
import 'package:tax_project/src/feature/dashboard/view/widget/main_widget/dashboard_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: DashboardWidget(),
      ),
    );
  }
}
