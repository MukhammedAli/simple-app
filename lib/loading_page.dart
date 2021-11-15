import 'package:flutter/material.dart';
import 'package:myapp2/BauncyPageRoute.dart';
import 'package:myapp2/login/login.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.all_inclusive_rounded,
            color: Colors.purple,
            size: 50.0,
          ),
          Center(
            // ignore: deprecated_member_use
            child: AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'Simple App',
                  textStyle: TextStyle(
                    fontSize: 50.0,
                    color: Colors.purple,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                  ),
                  colors: [
                    Colors.purple,
                    Colors.blue,
                    Colors.yellow,
                    Colors.red,
                    Colors.green,
                    Colors.pink
                  ],
                ),
              ],
              repeatForever: true,
              onTap: () async {
                Navigator.push(context, BouncyPageRoute(widget: LogInScreen()));
              },
            ),
          ),
          const SizedBox(height: 5.0),
          DefaultTextStyle(
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 15.0,
              letterSpacing: 1.0,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                RotateAnimatedText('Bunch of useful apps'),
                RotateAnimatedText('Live easily'),
                RotateAnimatedText('Love sincerely'),
                RotateAnimatedText('Create your own future'),
              ],
              repeatForever: true,
            ),
          ),
        ],
      ),
    );
  }
}
