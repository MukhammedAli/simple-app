import 'package:flutter/material.dart';
import 'package:myapp2/pages/home.dart';
import 'package:myapp2/pages/choose_loc.dart';
import 'package:myapp2/pages/loading_page.dart';
import 'package:myapp2/pages/choose.dart';

void main() => runApp(MaterialApp(
      title: 'Flutter project',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => LoadingPage(),
        '/home': (context) => ListOfWidgets(),
        '/location': (context) => ChooseLocation(),
        '/weather-app': (context) => Home(),
      },
    ));
