import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  var firstImage = "";
  var secondImage = "";
  BackgroundWidget({
    Key? key,
    required this.child,
    required this.firstImage,
    required this.secondImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(left: 0, top: 0, child: Image.asset(firstImage)),
          Positioned(left: 0, bottom: 0, child: Image.asset(secondImage)),
          child,
        ],
      ),
    );
  }
}
