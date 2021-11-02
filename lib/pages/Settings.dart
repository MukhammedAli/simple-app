import 'package:flutter/material.dart';

import '../colors.dart';
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.purple,
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
        toolbarHeight: 70,
        centerTitle: true,
        elevation: 0,),
      body: Center(child: Text("Settings",style: TextStyle(color: Colors.white),)),

    );
  }
}
