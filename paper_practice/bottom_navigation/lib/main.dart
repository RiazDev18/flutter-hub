import 'package:bottom_navigation/pages/about.dart';
import 'package:bottom_navigation/pages/contact.dart';
import 'package:bottom_navigation/pages/home.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(myApp());
}

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List Pages = [home(),about(),contact()];

  var selectPge = 0;

  void change(int index)
  {
    setState(() {
    selectPge = index;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[selectPge],
      bottomNavigationBar: BottomNavigationBar(
        onTap:change,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_travel),
            label: 'About'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
            label: 'Contact'
          )
        ],
    ),
    );
  }
}


// import '/pages/home.dart';
// // import '/pages/settings.dart';
// import '/pages/about.dart';
//
// import 'package:flutter/material.dart';
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Mobile App Development'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final List pages = [home(), about(), contact() ];
//   int selectedPage = 0;
//
//   void navChanged(int index) {
//
//     setState(() {
//       selectedPage= index;
//     });
//   }
//   @override
//   Widget build(BuildContext context)  {
//     return Scaffold(
//       body:  pages[selectedPage],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: navChanged,
//         items: [
//           // home
//           BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: "Home"
//           ),
//
//           // Profile
//           BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: "Profile"
//           ),
//
//           // Settings
//           BottomNavigationBarItem(
//               icon: Icon(Icons.settings),
//               label: "Settrings"
//           ),
//         ],
//       ),
//     );
//   }
// }