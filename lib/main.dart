import 'package:flutter/material.dart';
import 'package:myapp2/pages/home.dart';
import 'package:myapp2/pages/loading.dart';
import 'package:myapp2/pages/choose_loc.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    ));
