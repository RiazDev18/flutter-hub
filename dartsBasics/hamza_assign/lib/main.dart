// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Addition App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 TextEditingController? x = TextEditingController();
  TextEditingController? y = TextEditingController();
  int? sum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
     body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Addition"),
            const Text("X : "),
            TextField(controller: x,),
            const Text("Y : "),
            TextField(controller: y,),
            ElevatedButton(onPressed: Sum, child: const Text("Sum")),
            Text("Sum : $sum")
          ],
          )
        ),
    );
  }

  void Sum()
  {
    int X = int.parse(x!.text);
    int Y = int.parse(y!.text);
    sum = X+Y;
    setState(() {});
  } 
}
