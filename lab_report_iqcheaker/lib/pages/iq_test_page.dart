import 'package:flutter/material.dart';
import 'result_page.dart'; // Import the ResultsPage class

class IQTestPage extends StatefulWidget {
  @override
  _IQTestPageState createState() => _IQTestPageState();
}

class _IQTestPageState extends State<IQTestPage> {
  // Define the list of IQ test questions
  List<String> questions = [
    "What number comes next in the sequence: 2, 4, 6, 8, ___?",
    "Which word does not belong in the following list: Apple, Banana, Orange, Carrot, Grape?",
    // Add more questions here
  ];

  // Define the answers for the questions
  List<String> answers = [
    "10",
    "Carrot",
    // Add more answers here
  ];

  // Variables to track user input
  List<String> userAnswers = [];

  @override
  void initState() {
    super.initState();
    // Initialize userAnswers list with empty strings
    userAnswers = List.filled(questions.length, '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IQ Test Questions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Answer the following IQ questions:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(questions[index]),
                      subtitle: TextField(
                        onChanged: (value) {
                          setState(() {
                            userAnswers[index] = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your answer',
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Process user answers
                  int score = calculateScore();
                  // Navigate to the result page passing the score and questions
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(score: score, questions: questions),
                    ),
                  );
                },
                child: Text('Submit Answers'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to calculate the score based on user answers
  int calculateScore() {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i].toLowerCase() == answers[i].toLowerCase()) {
        score++;
      }
    }
    return score;
  }
}
