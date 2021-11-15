import 'package:flutter/material.dart';
import 'package:myapp2/BauncyPageRoute.dart';
import 'package:myapp2/MainPage/choose.dart';
import 'package:myapp2/NewLogin/rounded_button.dart';
import 'Login/login_screen.dart';
import 'constantslog.dart';
import 'background.dart';
import 'package:flutter_svg/svg.dart';
import 'rounded_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Welcome to Simple App",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 20),
          ),
          SizedBox(height: size.height * 0.05),
          SvgPicture.asset(
            "assets/icons/iconMobileNew.svg",
            height: size.height * 0.4,
          ),
          SizedBox(height: size.height * 0.05),
          RoundedButton(
              text: "LOG IN",
              press: () {
                Navigator.push(context, BouncyPageRoute(widget: LoginScreen()));
              },
              color: Colors.blueAccent),
          RoundedButton(
              text: "REGISTER", press: () {}, color: Colors.blueAccent[100]),
          // RoundedButton(
          //   text: "LOGIN",
          //   press: () {},
          //   color: kPrimaryColor,
          // ),
        ],
      ),
    ));
  }
}
