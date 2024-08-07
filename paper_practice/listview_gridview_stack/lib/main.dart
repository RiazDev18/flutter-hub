import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mobile App Development'),
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
  TextEditingController tcName=TextEditingController(text:"");
  TextEditingController tcCellNo=TextEditingController(text:"");
  String? name, cellNo;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context)  {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            TextField(controller: tcName,),
            TextField(controller: tcCellNo,),
            ElevatedButton(onPressed: saveData, child: Text("Save")),
            // ElevatedButton(onPressed: getData, child: Text('show')),
          ],
        )
    );
  }
  void saveData()async {
     SharedPreferences pref = await SharedPreferences.getInstance();
     await pref.setString('name', tcName.text.trim());
     await pref.setString('cell_no', tcCellNo.text.trim());
     tcName.clear();
     tcCellNo.clear();
     getData();
  }
  void getData()async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    tcName.text = await pref.getString('name') ?? '';
    tcCellNo.text = await pref.getString('cell_no') ?? '';
  }
  }

