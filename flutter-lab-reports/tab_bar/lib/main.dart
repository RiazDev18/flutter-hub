import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabBar example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  // String txt = '';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              title: Text("TabBar"),
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'Tab1',
                    icon: Icon(Icons.directions_bike),
                  ),
                  Tab(
                    text: 'Tab2',
                    icon: Icon(Icons.contact_mail),
                  ),
                  Tab(
                    text: 'Tab4',
                    icon: Icon(Icons.shopping_cart),
                  ),
                  Tab(
                    text: 'Tab2',
                    icon: Icon(Icons.contact_emergency),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                // Column(
                //   children: [
                //     // ElevatedButton(onPressed: text, child: Text("Veiw"))
                //   ],
                // ),
                Center(
                  child: Text("contents of tab1"),
                ),
                Center(
                  child: Text("content of tab2"),
                ),
                Center(
                  child: Text("content of tab3"),
                ),
                Center(
                  child: Text("content of tab4"),
                ),
              ],
            )
            ));
    // void text() {
    //   txt = 'riaz';
    // }
  }
}
