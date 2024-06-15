import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tax_project/src/feature/dashboard/view/pages/dashboard_page.dart';
import 'package:tax_project/src/feature/register/view/page/register_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  Future<bool> _checkIsFirst() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFirst') ?? true; // default to true if not set
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkIsFirst(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading data'));
        } else {
          bool isFirst = snapshot.data ?? true;
          return isFirst ? const RegisterPage() : const DashboardPage();
        }
      },
    );
  }
}
