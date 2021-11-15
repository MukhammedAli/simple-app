import 'package:flutter/material.dart';
import 'constantslog.dart';
import 'background.dart';
import 'package:flutter_svg/svg.dart';

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

  void newFunc() {
    press;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
            color: color,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            onPressed: newFunc,
            child: Text(text!, style: TextStyle(color: Colors.white))),
      ),
    );
  }
}
