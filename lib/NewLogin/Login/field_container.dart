// ignore: file_names
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FieldContainer extends StatelessWidget {
  Widget? child;
  FieldContainer({
    Key? key,
    this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: Colors.blueAccent[100],
          borderRadius: BorderRadius.circular(29)),
      child: child,
    );
  }
}
