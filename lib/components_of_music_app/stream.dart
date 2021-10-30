import 'package:flutter/material.dart';
import 'dart:async';

class ColorStream {
  late Stream colorStream;
  Stream<Color> getColors() async* {
    final List<Color> colors = [
      Colors.amber,
      Colors.white,
      Colors.lime,
      Colors.purple,
      Colors.teal
    ];
    yield* Stream.periodic(const Duration(seconds: 7), (int t) {
      int index = t % 5;
      return colors[index];
    });
  }
}
