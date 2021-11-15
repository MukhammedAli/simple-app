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
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Search",
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Bauman',
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
        style: TextStyle(color: Colors.black),
      )),
    );
  }
}
