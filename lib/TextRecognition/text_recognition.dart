import 'package:myapp2/TextRecognition/text_recognition_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextRecognition extends StatefulWidget {
  @override
  _TextRecognitionState createState() => _TextRecognitionState();
}

class _TextRecognitionState extends State<TextRecognition> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.lightBlue,
      title: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                    'Text Recognition',
                    style: GoogleFonts.raleway(
                    fontSize: 40,
                    fontWeight: FontWeight.w600
                  )
              )
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 40,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      toolbarHeight: 70,
      centerTitle: true,
      elevation: 0,
    ),
    body: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: const [
          SizedBox(height: 10),
          TextRecognitionWidget(),
          SizedBox(height: 10),
        ],
      ),
    ),
  );
}