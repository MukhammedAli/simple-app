import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/BMICalculator/input_page.dart';
import 'package:myapp2/BauncyPageRoute.dart';
import 'package:myapp2/Weather_app/weather_runner.dart';
import 'package:myapp2/chatdir/chat_app.dart';
import 'package:myapp2/colors.dart';
import 'package:myapp2/components_of_music_app/music_player.dart';
import 'package:myapp2/NoteApp/screens/taskscreen.dart';
import 'package:myapp2/MainPage/search.dart';
import 'package:myapp2/MainPage/settings.dart';
import 'package:myapp2/TimeApp/home.dart';
import 'package:myapp2/services/world_time.dart';
import 'package:myapp2/GoogleMap/map.dart';
import 'package:myapp2/ExampleApp/trying_to_use_mvc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:myapp2/TextRecognition/text_recognition.dart';

import 'package:myapp2/PaintApp/paint.dart';

final widgets = [
  'Time App',
  'BMI Calculator',
  'Music Player',
  'Example',
  'Note',
  'Map',
  'Text Recognition',
  'Weather App',
  'Paint App',
];

class ListOfWidgets extends StatefulWidget {
  const ListOfWidgets({Key? key}) : super(key: key);

  @override
  State<ListOfWidgets> createState() => _ListOfWidgetsState();
}

class _ListOfWidgetsState extends State<ListOfWidgets> {
  int _selectedTab = 0;

  void onSelected(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }


  final List<Widget> _widgetOptions = <Widget>[
    const Safe(
      myRoute: [],
    ),
    const Search(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions[_selectedTab],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: AppColor.dark,
          items: const [
            Icon(Icons.home, size: 35),
            Icon(Icons.search, size: 35),
            Icon(Icons.settings, size: 35),
          ],
          onTap: onSelected,
        ));
  }
}

class Safe extends StatefulWidget {
  const Safe({
    Key? key,
    required this.myRoute,
  }) : super(key: key);

  final List<String> myRoute;

  @override
  State<Safe> createState() => _SafeState();
}

class _SafeState extends State<Safe> {
  List<Widget>? myWidget = [
    const Home(),
    Weather(),
    const InputPage(),
    const MusicApp(),
    const MyExample(),
    const TasksScreen(),
    MapScreen(),
    TextRecognition(),
    const PaintApp(),
  ];

  List<String> myRoute = [
    '/time-app',
    '/weather',
    '/bmi-app',
    '/music_player',
    '/test_page',
    '/notification',
    '/google-maps',
    '/text-recognition',
    '/paint',
  ];

  final List<String> _widgetIcon = <String>[
    'assets/icons/timeIcon.png',
    'assets/icons/mapIcon.png',
    'assets/icons/bmiIcon.png',
    'assets/icons/playerIcon.png',
    'assets/icons/flutterIcon.png',
    'assets/icons/noteIcon.png',
    'assets/icons/mapIcon.png',
    'assets/icons/textIcon.png',
    'assets/icons/noteIcon.png',
  ];

  final List<String> _widgetDesc = <String>[
    "Shows current time in selected location.",
    "Shows current weather in selected location.",
    "Body Mass Index calculator.",
    "Listen to your favourite music.",
    "Example application for testing flutter.",
    "If you forgot, then it wasn't important.",
    "Find your place in the world.",
    "Get Latin-script text from an image.",
    "Draw something bratishka",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark, // background color of a page
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(
          color: Colors.black, // change your color here
        ),
        backgroundColor: topaz, // color of an AppBarr
        title: Text(
          "Choose",
          style: GoogleFonts.raleway(  // font of a main text of AppBar
            fontSize: 40,
            fontWeight: FontWeight.w600,
            color: white,  // color of a text
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {
              Navigator.push(context, BouncyPageRoute(widget: const ChatApp()));
            },
          )
        ],
        toolbarHeight: 70,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            itemCount: widgets.length,
            itemBuilder: (context, index) {
              WorldTime instance;
              return Container(
                margin: const EdgeInsets.all(8),
                child: Stack(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () async {
                        instance = WorldTime(
                            location: 'Almaty',
                            flag: 'kazakstan.png',
                            url: "Asia/Almaty");
                        // instance.getTime();
                        if (index == 0) {
                          await instance.getTime();
                          Navigator.pushNamed(context, '/time-app',
                              arguments: {
                                'location': instance.location,
                                'flag': instance.flag,
                                'time': instance.time,
                                'isDayTime': instance.isDayTime,
                              });
                        } else {
                          Navigator.push(context,
                              BouncyPageRoute(widget: myWidget![index]));
                        }
                      },
                      child: Card(
                        color: white, // main color of a Card
                        elevation: 12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Container(
                          height: 120,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image(
                                image: AssetImage(_widgetIcon[index]),
                                width: 70,
                                height: 70,
                              ),
                              const SizedBox(
                                width: 22,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                FittedBox(
                                fit: BoxFit.fitWidth,
                                  child: Text(
                                      widgets[index],
                                      style: GoogleFonts.raleway(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w400,
                                          color: darkRed // Widget name's color
                                      ),
                                    ),
                                  ),
                                  FittedBox(
                                  fit: BoxFit.fitWidth,
                                    child: Text(
                                        _widgetDesc[index],
                                        style: GoogleFonts.raleway(
                                          fontSize: 16,
                                          color: dark // Widget Description's color
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
