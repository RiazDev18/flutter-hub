import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add your logo image here
            Image.asset(
              'assets/logo.png', // Ensure you have the logo image in your assets folder
              height: 200, // Adjust as needed
              width: 200, // Adjust as needed
            ),
            SizedBox(height: 40),
            // Add a brief introduction text
            Text(
              'Welcome to Your App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'An amazing app to help you manage your tasks efficiently.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.purple[700],
              ),
            ),
            SizedBox(height: 50),
            // Get Started Button
            ElevatedButton(
              onPressed: () {
                // Navigate to the main page (Homepage)
                Navigator.pushReplacementNamed(context, '/homepage');
              },
              child: Text('Get Started'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,// Correct parameter for background color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
