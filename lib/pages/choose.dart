import 'package:flutter/material.dart';
import 'package:myapp2/BMICalculator/bmimainpage.dart';
import 'package:myapp2/colors.dart';
import 'package:myapp2/pages/Search.dart';
import 'package:myapp2/pages/Settings.dart';
import 'package:myapp2/pages/home.dart';
import 'package:myapp2/services/world_time.dart';

final widgets = ['Weather app', 'BMI Calculator'];

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
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Main",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        onTap: onSelected,
      ),
    );
  }
}

class Safe extends StatefulWidget {
  const Safe({
    Key? key,
    required this.myRoute,
  }) : super(key: key);

  final List<Route> myRoute;

  @override
  State<Safe> createState() => _SafeState();
}

class _SafeState extends State<Safe> {
  List<Route> myRoute = [
    MaterialPageRoute(builder: (_) => const Home()),
    MaterialPageRoute(builder: (_) => BMICalculator())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.purple,
        title: const Text(
          "Choose application",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w300,
            color: Colors.black,
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
                      onTap: () async {
                        instance = WorldTime(
                            location: 'Almaty',
                            flag: 'kazakstan.png',
                            url: "Asia/Almaty");
                        await instance.getTime();
                        if (index == 0) {
                          Navigator.pushNamed(context, '/weather-app',
                              arguments: {
                                'location': instance.location,
                                'flag': instance.flag,
                                'time': instance.time,
                                'isDayTime': instance.isDayTime,
                              });
                        } else {
                          Navigator.of(context).push(myRoute[index]);
                        }
                      },
                      child: Card(
                        color: Colors.purple,
                        elevation: 12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const FlutterLogo(size: 48),
                              const SizedBox(
                                width: 16,
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
                                    const Text(
                                      'Some description',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(Icons.navigate_next,
                                  size: 60, color: Colors.black)
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
