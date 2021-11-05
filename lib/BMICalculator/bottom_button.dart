import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const BottomButton({required this.onTap, required this.buttonTitle});

  final String buttonTitle;
  final Function onTap;

  void newNavigatorFunc() {
    onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: newNavigatorFunc,
      child: Container(
        child: Center(child: Text(buttonTitle, style: kLargeButtonTextStyle)),
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
