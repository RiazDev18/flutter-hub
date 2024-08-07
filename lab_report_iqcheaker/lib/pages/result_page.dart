import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final int score;
  final List<String> questions;

  ResultsPage({required this.score, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your score: $score / ${questions.length}', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to previous screen
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
