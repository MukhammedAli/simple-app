import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        backgroundColor: topaz,
        title: Text(
          "Search",
          style: GoogleFonts.raleway(
            fontSize: 40,
            fontWeight: FontWeight.w600,
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
        style: GoogleFonts.raleway(
            color: darkRed,
            fontSize: 30,
            fontWeight: FontWeight.w300
        ),
      )),
    );
  }
}
