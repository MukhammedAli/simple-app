import 'package:flutter/material.dart';
import 'package:myapp2/colors.dart';
import 'package:myapp2/pages/home.dart';
import 'package:myapp2/pages/loading.dart';
import 'package:myapp2/pages/choose_loc.dart';
import 'package:myapp2/services/world_time.dart';


final widgets = ['Weather app', 'BMI Calculator'];



class ListOfWidgets extends StatefulWidget {
  @override
  State<ListOfWidgets> createState() => _ListOfWidgetsState();
}

class _ListOfWidgetsState extends State<ListOfWidgets> {
  List<Route> myRoute = [
    MaterialPageRoute(builder: (_) => Home() ),
    MaterialPageRoute(builder: (_) => ChooseLocation() )
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      appBar: AppBar(
        automaticallyImplyLeading: false,
          backgroundColor: Colors.amber,
        primary: false,
        title: Text("Main Page",
          style:TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w300,
            color: dark,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        // toolbarOpacity: 0.5,
        elevation: 0,

        bottom: PreferredSize(
            child: Container(
              color: dark,
              height: 4.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      body: SafeArea(
        child: ListView.builder(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
            itemCount: widgets.length,
            itemBuilder: (context, index) {
              WorldTime instance;
              return Container(
                margin: EdgeInsets.all(16),
                child: Stack(
                  children: <Widget>[
                    GestureDetector(
                onTap: () async {
                WorldTime instance = WorldTime(
                location: 'Almaty', flag: 'kazakstan.png', url: "Asia/Almaty");
                await instance.getTime();
                if(index == 0){
                  Navigator.pushNamed(context, '/weather-app', arguments: {
                    'location': instance.location,
                    'flag': instance.flag,
                    'time': instance.time,
                    'isDayTime': instance.isDayTime,
                  });
                }
                else {
                  Navigator.of(context).push(myRoute[index]);
                }
              },
                      child: Card(
                        color: Colors.amber,
                        elevation: 12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 36),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FlutterLogo(size: 48),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      widgets[index],
                                      style:TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w300,
                                          color: white,
                                      ),
                                    ),
                                    Text('Some description',
                                      style:TextStyle(
                                        fontSize: 16,
                                        color: white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.navigate_next,
                                size: 60,
                                color: Colors.white,
                              )
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