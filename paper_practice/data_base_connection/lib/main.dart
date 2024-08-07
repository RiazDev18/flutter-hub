import 'package:data_base_connection/services/data_service.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final databaseService = DatabaseService();
  String? reg_no, name, cell_no;
  TextEditingController tcRegNo = TextEditingController();
  TextEditingController tcName = TextEditingController();
  TextEditingController tcCellNo = TextEditingController();
  String? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Reg. No."),
              controller: tcRegNo,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Name"),
              controller: tcName,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Cell No"),
              controller: tcCellNo,
            ),
            ElevatedButton(onPressed: addRecord, child: Text("Save")),
            ElevatedButton(onPressed: printData, child: Text("Print Data")),

          ]
      ),
    );
  }

  void addRecord() async {
    await databaseService.addStudent(tcRegNo.text, tcName.text, tcCellNo.text);
    print('added');
  }

  Future<List<Map<dynamic, dynamic>>> printData() async {
     return await databaseService.getStudents();
  }


}