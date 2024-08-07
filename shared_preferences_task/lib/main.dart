import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();
  List<String> _items = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  // Load items from Shared Preferences
  _loadItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? itemsJson = prefs.getString('items');
    if (itemsJson != null) {
      setState(() {
        _items = List<String>.from(json.decode(itemsJson));
      });
    }
  }

  // Clear all items in the list


  // Save items to Shared Preferences
  _saveItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String itemsJson = json.encode(_items);
    await prefs.setString('items', itemsJson);
  }

  // Add new item to the list
  _addItem() {
    setState(() {
      _items.add(_controller.text);
      _controller.clear();
    });
    _saveItems();
  }

  _deleteAll()
  {
    setState(() {
      _items.clear();
    });
  }

  // Update item in the list
  _updateItem(int index, String newItem) {
    setState(() {
      _items[index] = newItem;
    });
    _saveItems();
  }

  // Delete item from the list
  _deleteItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
    _saveItems();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences List Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter item'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addItem,
              child: Text('Add Item'),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: _deleteAll,
              child: Text('Delete All Items'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_items[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _showUpdateDialog(index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _deleteItem(index);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Show dialog to update item
  _showUpdateDialog(int index) {
    TextEditingController _updateController =
    TextEditingController(text: _items[index]);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Item'),
          content: TextField(
            controller: _updateController,
            decoration: InputDecoration(labelText: 'Enter new item'),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                _updateItem(index, _updateController.text);
                Navigator.of(context).pop();
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }
}





/*import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SharedPreferences Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController tc1 = TextEditingController();
  List<String> myList = [];

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  Future<void> loadItems() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? storedList = pref.getStringList('myList');
    if (storedList != null) {
      setState(() {
        myList = storedList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Persistence'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: tc1,
                decoration: InputDecoration(
                  labelText: 'Enter new item',
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity, //
                child: ElevatedButton(
                  onPressed: addNew,
                  child: const Text('Add New'),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                width: double.infinity, // Match parent width
                child: ElevatedButton(
                  onPressed: clearAll,
                  child: const Text('Clear All'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: myList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(myList[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addNew() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String newItem = tc1.text.trim();
    if (newItem.isNotEmpty) {
      setState(() {
        myList.add(newItem);
      });
      await pref.setStringList('myList', myList);
      tc1.clear();
    }
  }

  void clearAll() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      myList.clear();
    });
    await pref.remove('myList');
  }
}*/
