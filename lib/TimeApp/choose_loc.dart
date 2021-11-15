import 'package:flutter/material.dart';
import 'package:myapp2/services/world_time.dart';
import '/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Almaty', location: 'Almaty', flag: 'kz.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  @override
  void initState() {
    super.initState();
  }

  void updateTime(index) async {
    WorldTime instance = locations[index];
    //wait till it run
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Choose location",
          style: GoogleFonts.raleway(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.w600
          ),
        ),
        centerTitle: true,
        toolbarHeight: 70,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemExtent: 100,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Card(
              elevation: 12,
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                contentPadding: const EdgeInsets.symmetric(vertical: 11.5, horizontal: 10.0),
                title: Text(
                    locations[index].location,
                    style: GoogleFonts.barlow(
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                      color: dark
                    )
                ),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: dark,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage:
                    AssetImage(
                      'assets/${locations[index].flag}',
                    ),
                  )
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
