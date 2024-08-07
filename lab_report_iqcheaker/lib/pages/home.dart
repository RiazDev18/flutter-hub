import 'package:flutter/material.dart';
import 'iq_test_page.dart';
import 'result_page.dart';
import 'setting_page.dart';

class HomeScreen extends StatelessWidget {
  // Dummy score value for demonstration
  final int score = 10; // Replace with your actual score value

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('IQ Checker'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'IQ Tests'),
              Tab(text: 'Results'),
              Tab(text: 'Settings'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            IQTestPage(),
            ResultsPage(score: score, questions: [],),
            SettingsPage(),
          ],
        ),
      ),
    );
  }
}
