import 'package:flutter/material.dart';

void main() {
  runApp(WisdomQuotesApp());
}

class WisdomQuotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisdom Quotes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WisdomQuotesPage(),
    );
  }
}

class WisdomQuotesPage extends StatefulWidget {
  @override
  _WisdomQuotesPageState createState() => _WisdomQuotesPageState();
}

class _WisdomQuotesPageState extends State<WisdomQuotesPage> {
  final List<String> _quotes = [
    "It is not what you look at that matters, it's what you see. - Henry David Thoreau",
    "The journey of a thousand miles begins with one step. - Lao Tzu",
    "The art of being wise is knowing what to overlook.- William James",
    "In the middle of every difficulty lies opportunity. - Albert Einstein",
    "The more I read, the more I acquire, the more certain I am that I know nothing. - Voltaire",
  ];

  int _currentIndex = 0;

  void _showNextQuote() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _quotes.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wisdom Quotes'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _quotes[_currentIndex],
                style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  color: Colors.redAccent,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _showNextQuote,
                child: Text('Show Next Quote'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
