import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = "";
  String flag = "";
  String url = "";
  bool isDayTime = false;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response = await get(
          Uri.parse("https://www.worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      //print(data);

      //get property from data
      String datetime = data["datetime"];
      String offset = data["utc_offset"].substring(1, 3);
      //print(datetime);
      //print(offset);

      //create date time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("Helol $e");
      time = 'could not get time data';
    }
  }
}
