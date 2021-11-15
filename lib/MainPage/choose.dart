import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/BMICalculator/bmimainpage.dart';
import 'package:myapp2/BMICalculator/input_page.dart';
import 'package:myapp2/BauncyPageRoute.dart';
import 'package:myapp2/colors.dart';
import 'package:myapp2/components_of_music_app/music_player.dart';
import 'package:myapp2/NoteApp/screens/taskscreen.dart';
import 'package:myapp2/MainPage/Search.dart';
import 'package:myapp2/MainPage/Settings.dart';
import 'package:myapp2/Weather/choose_loc.dart';
import 'package:myapp2/Weather/home.dart';
import 'package:myapp2/services/world_time.dart';
import 'package:myapp2/GoogleMap/map.dart';
import 'package:myapp2/ExampleApp/trying_to_use_mvc.dart';

final widgets = [
  'Weather app',
  'BMI Calculator',
  'Music Player',
  'Example page',
  'Note',
  'Google Maps'
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
    const InputPage(),
    const MusicApp(),
    const MyExample(),
    const TasksScreen(),
    MapScreen()
  ];

  List<String> myRoute = [
    '/weather-app',
    '/bmi-app',
    '/music_player',
    '/test_page',
    '/notification',
    '/google-maps'
  ];

  final List<String> _widgetIcon = <String>[
    'assets/icons/weatherIcon.png',
    'assets/icons/bmiIcon.png',
    'assets/icons/playerIcon.png',
    'assets/icons/flutterIcon.png',
    'assets/icons/noteIcon.png',
    'assets/icons/mapIcon.png'
  ];

  final List<String> _widgetDesc = <String>[
    "Shows weather conditions in your current location.",
    "Body Mass Index calculator.",
    "Listen to your favourite music.",
    "Example application for testing flutter.",
    "If you forgot, then it wasn't important.",
    "Find your place in the world."
  ];

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
          "Choose application",
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
                      onTap: () {
                        instance = WorldTime(
                            location: 'Welcome page',
                            flag: 'kazakstan.png',
                            url: "Asia/Almaty");
                        instance.getTime();
                        if (index == 0) {
                          Navigator.pushNamed(context, '/weather-app',
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

                        color: Colors.blueAccent,
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
                                    Text(
                                      widgets[index],
                                      style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      _widgetDesc[index],
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
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
