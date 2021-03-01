import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './widgets.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Container(
          child: Text('Hello World'),
        ));
  }
}

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  SharedPreferences prefs;
  TextStyle textStyle = TextStyle(fontSize: 24);
  TextEditingController txtWork;
  TextEditingController txtShort;
  TextEditingController txtLong;
  static const String WORKTIME = "workTime";
  static const String SHORTBREAK = "shortBreak";
  static const String LONGBREAK = "longBreak";
  int workTime;
  int shortBreak;
  int longBreak;


  @override
  void initState() {
    TextEditingController txtWork = TextEditingController();
    TextEditingController txtShort = TextEditingController();
    TextEditingController txtLong = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        childAspectRatio: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: <Widget>[
          Text('work',style: textStyle),
          Text(''),
          Text(''),
          SettingsButton(Color(0xff455A64), "-", -1),
          TextField(
              style: textStyle,
              textAlign: TextAlign.center,
              controller: txtWork,
              keyboardType: TextInputType.number),
          SettingsButton(Color(0xff009688), "+", 1,),
          Text("Short", style: textStyle),
          Text(""),
          Text(""),
          SettingsButton(Color(0xff455A64), "-", -1, ),
          TextField(
              style: textStyle,
              textAlign: TextAlign.center,
              controller: txtShort,
              keyboardType: TextInputType.number),
          SettingsButton(Color(0xff009688), "+", 1),
          Text("Long", style: textStyle,),
          Text(""),
          Text(""),
          SettingsButton(Color(0xff455A64), "-", -1,),
          TextField(
              style: textStyle,
              textAlign: TextAlign.center,
              controller: txtLong,
              keyboardType: TextInputType.number),
          SettingsButton(Color(0xff009688), "+", 1,),
        ],
        padding: const EdgeInsets.all(20.0),
      ),
    );
  }
}
