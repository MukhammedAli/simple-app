import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp2/BMICalculator/bmimainpage.dart';
import 'package:myapp2/BMICalculator/input_page.dart';
import 'package:myapp2/colors.dart';
import 'package:myapp2/components_of_music_app/music_player.dart';
import 'package:myapp2/notifications/screens/taskscreen.dart';
import 'package:myapp2/pages/home.dart';
import 'package:myapp2/pages/choose_loc.dart';
import 'package:myapp2/loading_page.dart';
import 'package:myapp2/pages/choose.dart';
import 'package:myapp2/pages/loading.dart';
import 'package:myapp2/translation/localeString.dart';
import 'package:myapp2/using_mvc/trying_to_use_mvc.dart';
import 'package:myapp2/notifications/notificationsmain.dart';

void main() => runApp(
      GetMaterialApp(
        translations: LocalString(),
        locale: Locale('en','US'),
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
          '/test_page': (context) => const MyExample(),
          '/notification': (context) => const TasksScreen(),
          '/': (context) => const Loading(),
          //'/' : (context) => const LoadingPage(),
          //'/home': (context) => const ListOfWidgets(),
        },
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.dark,
        ),
      ),
    );
