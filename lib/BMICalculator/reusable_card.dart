import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ReusableCard({required this.color, this.width = 170.0, this.cardChild});

  final double width;
  final Color? color;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 200.0,
      width: width,
    );
  }
}
