import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:myapp2/MainPage/choose.dart';
import 'package:myapp2/Weather_app/constants.dart';
import 'package:myapp2/Weather_app/pages/city_screen.dart';
import 'package:myapp2/Weather_app/services/weather.dart';
import 'package:myapp2/new_home_page/home_page.dart';

class HomeScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const HomeScreen({this.locationWeather});

  // ignore: prefer_typing_uninitialized_variables
  final locationWeather;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel weather = WeatherModel();

  DateTime date = DateTime.now();

  late int temperature;
  late int temperatureMin;
  late int temperatureMax;
  late String weatherIcon;
  late String cityName;
  late String dayName;
  late String weatherCondition;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        temperatureMin = 0;
        temperatureMax = 0;
        weatherIcon = 'Error';
        cityName = '';
        weatherCondition = '';
        return;
      }

      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();

      var tempMin = weatherData['main']['temp_min'];
      temperatureMin = tempMin.toInt();

      var tempMax = weatherData['main']['temp_max'];
      temperatureMax = tempMax.toInt();

      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);

      cityName = weatherData['name'];

      dayName = DateFormat('EEEE').format(date);

      weatherCondition = weatherData['weather'][0]['main'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: buildAppBar(),
        body: Container(
          alignment: Alignment.center,
          // constraints: BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    cityName,
                    style: kCityNameTextStyle,
                  ),
                  Text(
                    dayName,
                    style: kTimeTextStyle,
                  ),
                ],
              ),
              Image.asset(
                'assets/images/$weatherIcon.png',
                height: 160,
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      '$temperature°',
                      style: kTemperatureTextStyle,
                    ),
                  ),
                  Text(
                    weatherCondition.toUpperCase(),
                    style: kConditionTextStyle,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/thermometer_low.png',
                    height: 50,
                  ),
                  Text(
                    '$temperatureMin°',
                    style: kSmallTemperatureTextStyle,
                  ),
                  Image.asset(
                    'assets/images/thermometer_high.png',
                    height: 50,
                  ),
                  Text(
                    '$temperatureMax°',
                    style: kSmallTemperatureTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  var count = 0;
  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 40,
        ),
        onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomePage(),
        )),
      ),
      actions: <Widget>[
        IconButton(
          highlightColor: Colors.transparent,
          splashRadius: 27.5,
          icon: const Icon(
            Icons.near_me,
            color: Colors.white,
          ),
          onPressed: () async {
            var weatherData = await weather.getLocationWeather();
            updateUI(weatherData);
          },
        ),
        const SizedBox(
          width: 30.0,
        ),
        IconButton(
          highlightColor: Colors.transparent,
          splashRadius: 27.5,
          icon: const Icon(
            Icons.my_location,
            color: Colors.white,
          ),
          onPressed: () async {
            var typedName = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CityScreen();
                },
              ),
            );
            if (typedName != null) {
              var weatherData = await weather.getCityWeather(typedName);
              updateUI(weatherData);
            }
          },
        )
      ],
    );
  }
}
