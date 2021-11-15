import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  const BackgroundWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              left: 0, top: 0, child: Image.asset("assets/images/ending.png")),
          Positioned(
              left: 0,
              bottom: 0,
              child: Image.asset("assets/images/ellipseforlog2.png")),
          child,
        ],
      ),
    );
  }
}
