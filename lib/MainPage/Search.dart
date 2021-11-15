import 'package:flutter/material.dart';

import '../colors.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.purple,
        title: const Text(
          "Search",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
        toolbarHeight: 70,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
          child: Text(
        "Search",
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
