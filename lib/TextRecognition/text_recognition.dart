import 'package:myapp2/TextRecognition/text_recognition_widget.dart';
import 'package:flutter/material.dart';

class TextRecognition extends StatefulWidget {
  @override
  _TextRecognitionState createState() => _TextRecognitionState();
}

class _TextRecognitionState extends State<TextRecognition> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Text Recognition"),
    ),
    body: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: const [
          SizedBox(height: 25),
          TextRecognitionWidget(),
          SizedBox(height: 15),
        ],
      ),
    ),
  );
}