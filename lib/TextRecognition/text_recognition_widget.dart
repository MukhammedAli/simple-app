import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:myapp2/TextRecognition/ml_api.dart';
import 'package:myapp2/TextRecognition/text_area_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'controls_widget.dart';

class TextRecognitionWidget extends StatefulWidget {
  const TextRecognitionWidget({
    Key? key,
  }) : super(key: key);

  @override
  _TextRecognitionWidgetState createState() => _TextRecognitionWidgetState();
}

class _TextRecognitionWidgetState extends State<TextRecognitionWidget> {
  String text = '';
  File? image;


  @override
  Widget build(BuildContext context) => Expanded(
    child: Column(
      children: [
        Expanded(child: buildImage()),
        const SizedBox(height: 32),
        ControlsWidget(
          onClickedPickImage: pickImage,
          onClickedScanText: scanText,
          onClickedClear: clear,
        ),
        const SizedBox(height: 32),
        TextAreaWidget(
          text: text,
          onClickedCopy: copyToClipboard,
        ),
      ],
    ),
  );

  Widget buildImage() => Container(
    child: image != null
        ? Image.file(image!)
        : Icon(Icons.photo, size: 80, color: Colors.black),
  );

  Future pickImage() async {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Cancel",
                ),
              ),
            ],
            content: Container(
              height: 120,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.camera),
                    title: Text(
                      "Camera",
                    ),
                    onTap: () async{
                      final file = await ImagePicker().pickImage(source: ImageSource.camera);
                      Navigator.of(context).pop();
                      setImage(File(file!.path));
                    },
                  ),
                  Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: Icon(Icons.image),
                    title: Text(
                      "Gallery",
                    ),
                    onTap: () async{
                      final file = await ImagePicker().pickImage(source: ImageSource.gallery);
                      Navigator.of(context).pop();
                      setImage(File(file!.path));
                    },
                  ),
                ],
              ),
            ),
          );
        });
    }

  Future scanText() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    final text = await MLApi.recogniseText(image!);
    setText(text);

    Navigator.of(context).pop();
  }

  void clear() {
    setImage(null);
    setText('');
  }

  void copyToClipboard() {
    if (text.trim() != '') {
      FlutterClipboard.copy(text);
    }
  }

  void setImage(File? newImage) {
    setState(() {
      image = newImage;
    });
  }

  void setText(String newText) {
    setState(() {
      text = newText;
    });
  }

}