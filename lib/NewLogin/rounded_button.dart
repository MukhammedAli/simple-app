import 'package:flutter/material.dart';
import 'package:myapp2/BauncyPageRoute.dart';
import 'package:myapp2/NewLogin/Login/login_screen.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final Function? press;
  final Color? color, textColor;

  const RoundedButton({
    Key? key,
    this.text,
    this.press,
    this.color,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        // ignore: deprecated_member_use
        child: FlatButton(
            color: color,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            onPressed: () {
              Navigator.push(context, BouncyPageRoute(widget: LoginScreen()));
            },
            child: Text(text!, style: const TextStyle(color: Colors.white))),
      ),
    );
  }
}
