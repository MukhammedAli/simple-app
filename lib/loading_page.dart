import 'package:flutter/material.dart';
import 'package:myapp2/BauncyPageRoute.dart';
import 'package:myapp2/NewLogin/welcome_page.dart';
import 'package:myapp2/login/login.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.all_inclusive_rounded,
            color: Colors.blueAccent,
            size: 50.0,
          ),
          Center(
            // ignore: deprecated_member_use
            child: AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'Simple App',
                  textStyle: const TextStyle(
                    fontSize: 50.0,
                    color: Colors.blueAccent,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                  ),
                  colors: [
                    Colors.blueAccent,
                    Colors.purple,
                    Colors.yellow,
                    Colors.red,
                    Colors.green,
                    Colors.pink
                  ],
                ),
              ],
              repeatForever: true,
              onTap: () async {
                Navigator.push(
                    context, BouncyPageRoute(widget: WelcomeScreen()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5.0),
            height: 30,
            child: DefaultTextStyle(
              style: const TextStyle(
                color: Colors.black,
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
          ),
        ],
      ),
    );
  }
}
