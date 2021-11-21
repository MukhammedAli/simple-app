import 'package:flutter/material.dart';
import 'package:myapp2/NewLogin/Login/body_widget_registration.dart';
import 'background_widget.dart';
import 'body_widget.dart';

// ignore: use_key_in_widget_constructors
class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BodyWidgetRegistration(),
    );
  }
}
