import 'package:flutter/material.dart';

class TextAreaWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClickedCopy;

  const TextAreaWidget({
    required this.text,
    required this.onClickedCopy,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: Container(
          height: 175,
          decoration: BoxDecoration(border: Border.all()),
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          child: SelectableText(
            text.isEmpty ? 'Scan an Image to get text' : text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const SizedBox(width: 10),
      IconButton(
        icon: Icon(Icons.copy, color: Colors.black, size: 35),
        color: Colors.grey[200],
        onPressed: onClickedCopy,
      ),
    ],
  );
}