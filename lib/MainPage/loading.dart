// ignore_for_file: use_function_type_syntax_for_parameters

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myapp2/loading_page.dart';

import '../BauncyPageRoute.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // ignore: non_constant_identifier_names
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, BouncyPageRoute(widget: const LoadingPage()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 60.0,
        ),
      ),
    );
  }
}
