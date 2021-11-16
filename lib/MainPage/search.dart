import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp2/BMICalculator/input_page.dart';
import 'package:myapp2/ExampleApp/trying_to_use_mvc.dart';
import 'package:myapp2/GoogleMap/map.dart';
import 'package:myapp2/NoteApp/screens/taskscreen.dart';
import 'package:myapp2/TimeApp/home.dart';
import 'package:myapp2/components_of_music_app/music_player.dart';
import 'package:myapp2/services/world_time.dart';
import '../BauncyPageRoute.dart';
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
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 40, color: white),
            onPressed: () async {
              showSearch(context: context, delegate: WidgetSearch());

              // final results = await
              //     showSearch(context: context, delegate: CitySearch());

              // print('Result: $results');
            },
          )
        ],
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
        "Search for Widgets",
        style: GoogleFonts.raleway(
            color: darkRed,
            fontSize: 60,
            fontWeight: FontWeight.w600,
        ),
            textAlign: TextAlign.center,
      )),
    );
  }
}

class WidgetSearch extends SearchDelegate<String> {



  final widgets = [
    'Time',
    'Body Mass Index',
    'Music Player',
    'Test Page',
    'Example',
    'Note',
    'Maps',
  ];


 // TODO add working recent widgets
  final recentWidgets = [
    'Time',
    'Body Mass Index',
    'Note',
  ];

  List<Widget>? myWidget = [
    const Home(),
    const InputPage(),
    const MusicApp(),
    const MyExample(),
    const TasksScreen(),
    MapScreen()
  ];


  @override
  List<Widget> buildActions(BuildContext context) => [
    IconButton(
      icon: const Icon(Icons.clear, size: 40),
      onPressed: () {
        if (query.isEmpty) {
          close(context, "");
        } else {
          query = '';
          showSuggestions(context);
        }
      },
    )
  ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back, size: 40),
    onPressed: () => close(context, ""),
  );

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  void showResults(BuildContext context) {
    WorldTime instance = WorldTime(
        location: 'Welcome page',
        flag: 'kazakstan.png',
        url: "Asia/Almaty");
    instance.getTime();
    if(query == "Time") {
      Navigator.pushNamed(context, '/time-app',
          arguments: {
            'location': instance.location,
            'flag': instance.flag,
            'time': instance.time,
            'isDayTime': instance.isDayTime,
          }
      );
    }
    else if(query == "Body Mass Index"){
      Navigator.push(context,
          BouncyPageRoute(widget: myWidget![1]));
    }
    else if(query == "Test Page" || query == "Example"){
      Navigator.push(context,
          BouncyPageRoute(widget: myWidget![3]));
    }
    else if(query == "Music Player"){
      Navigator.push(context,
          BouncyPageRoute(widget: myWidget![2]));
    }
    else if(query == "Note"){
      Navigator.push(context,
          BouncyPageRoute(widget: myWidget![4]));
    }
    else if(query == "Maps"){
      Navigator.push(context,
          BouncyPageRoute(widget: myWidget![5]));
    }
      super.showResults(context);
    }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? recentWidgets
        : widgets.where((widget) {
      final widgetLower = widget.toLowerCase();
      final queryLower = query.toLowerCase();

      return widgetLower.startsWith(queryLower);
    }).toList();

    return buildSuggestionsSuccess(suggestions);
  }

  Widget buildSuggestionsSuccess(List<String> suggestions) => ListView.builder(
    itemCount: suggestions.length,
    itemBuilder: (context, index) {
      final suggestion = suggestions[index];
      final queryText = suggestion.substring(0, query.length);
      final remainingText = suggestion.substring(query.length);

      return ListTile(
        onTap: () {
          query = suggestion;

          // 1. Show Results
          showResults(context);

          // 2. Close Search & Return Result
          // close(context, suggestion);

          // 3. Navigate to Result Page
          //  Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (BuildContext context) => ResultPage(suggestion),
          //   ),
          // );
        },
        leading: Icon(CupertinoIcons.info, size: 30),
        // title: Text(suggestion),
        title: RichText(
          text: TextSpan(
            text: queryText,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            children: [
              TextSpan(
                text: remainingText,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
