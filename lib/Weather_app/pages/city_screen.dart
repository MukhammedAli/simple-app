import 'package:flutter/material.dart';
import 'package:myapp2/Weather_app/constants.dart';

// ignore: use_key_in_widget_constructors
class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Column(
          children: <Widget>[
            TextField(
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: kTextFieldInputDecoration,
              onChanged: (value) {
                cityName = value;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 50.0,
              width: double.infinity,
              // ignore: deprecated_member_use
              child: FlatButton(
                color: const Color(0xFFFCA311),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: const Text(
                  'Search',
                  style: kButtonTextStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        highlightColor: Colors.transparent,
        splashRadius: 27.5,
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
