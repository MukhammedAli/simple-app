import 'package:flutter/material.dart';
import 'package:myapp2/pages/home.dart';
import 'package:myapp2/pages/loading.dart';
import 'package:myapp2/pages/choose_loc.dart';
import 'package:myapp2/pages/loading_page.dart';
import 'package:myapp2/BMICalculator/bmimainpage.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/bmire',
      routes: {
        // '/': (context) => Loading(),
        // '/home': (context) => LoadingPage(),
        // '/location': (context) => ChooseLocation(),
        '/bmire': (context) => BMICalculator(),
      },
    ));
