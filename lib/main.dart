import 'package:flutter/material.dart';
import 'package:myapp2/BMICalculator/input_page.dart';
import 'package:myapp2/MainPage/loading.dart';
import 'package:myapp2/colors.dart';
import 'package:myapp2/components_of_music_app/music_player.dart';
import 'package:myapp2/Weather/home.dart';
import 'package:myapp2/Weather/choose_loc.dart';
import 'package:myapp2/loading_page.dart';
import 'package:myapp2/MainPage/choose.dart';
import 'package:myapp2/GoogleMap/map.dart';

void main() => runApp(
      MaterialApp(
        title: 'Flutter project',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/first': (context) => const LoadingPage(),
          '/second': (context) => const ListOfWidgets(),
          '/weather-app': (context) => const Home(),
          '/weather-app-location': (context) => const ChooseLocation(),
          '/bmi-app': (context) => const InputPage(),
          '/music_player': (context) => const MusicApp(),
          '/google-maps': (context) => MapScreen(),
          '/': (context) => const Loading(),
          //'/home': (context) => const ListOfWidgets(),
        },
        theme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.purple,
              selectedItemColor: Colors.white,
              unselectedItemColor: AppColor.dark),
        ),
      ),
    );
