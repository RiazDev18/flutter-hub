import 'package:flutter/material.dart';
import 'package:sqlite_practice/dog_database.dart';

void main() {
  runApp(DogApp());
}

class DogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController tc1 = TextEditingController();
  TextEditingController tc2 = TextEditingController();
  TextEditingController tc3 = TextEditingController();

  List dogList = [];

  final database = dogDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dog Database"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(label: Text("Dog ID")),
            controller: tc1,
            keyboardType: TextInputType.number,
          ),
          TextField(
            decoration: InputDecoration(label: Text("Dog Name")),
            controller: tc2,
          ),
          TextField(
            decoration: InputDecoration(label: Text("Age")),
            controller: tc3,
            keyboardType: TextInputType.number,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: save, child: Text("Save")),
              ElevatedButton(onPressed: showDogs, child: Text("Show")),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dogList.length,
              itemBuilder: (context, index) {
                final res = dogList[index];
                return ListTile(
                  key: ValueKey('${res['id']}'),
                  title: Text('${res['name']}'),
                  subtitle: Text('${res['age']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => delete(res['id']),
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> save() async {
    await database.insertDog(int.parse(tc1.text), tc2.text, int.parse(tc3.text));
    tc1.clear();
    tc2.clear();
    tc3.clear();
    showDogs();
  }

  Future<void> showDogs() async {
    final data = await database.getDog();
    setState(() {
      dogList = data;
    });
  }

  void delete(int id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Dog'),
          content: const Text('Are you sure you want to delete this dog?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void update(int id) {
  }
}
