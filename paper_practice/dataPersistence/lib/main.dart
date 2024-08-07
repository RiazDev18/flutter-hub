
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()
{
  runApp(app());
}
class app extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DataBase Connection',
      home: myHomePage(),
    );
  }
}
class myHomePage extends StatelessWidget {
  TextEditingController tc1 = TextEditingController();
  TextEditingController tc2 = TextEditingController();
  String? name;
  String? cellNo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Persistence'),
      ),
      body: Column(
        children: [
          TextField(controller: tc1,),
          TextField(controller: tc2,),
          ElevatedButton(onPressed: savaData, child: Text('Save')),
          ElevatedButton(onPressed: getData, child: Text('Get'))
        ],
      ),
    );
  }

  void savaData() async
  {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('name', tc1.text.trim());
    await pref.setString('cellNo', tc2.text.trim());
    tc1.clear();
    tc2.clear();
  }

  void getData() async
  {
    SharedPreferences pref = await SharedPreferences.getInstance();
    tc1.text = await pref.getString('name') ?? '';
    tc2.text = await pref.getString('cellNo') ?? '';

  }
}
