import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ControlsWidget extends StatelessWidget {
  final VoidCallback onClickedPickImage;
  final VoidCallback onClickedScanText;
  final VoidCallback onClickedClear;

  const ControlsWidget({
    required this.onClickedPickImage,
    required this.onClickedScanText,
    required this.onClickedClear,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.lightBlue,
        ),
        onPressed: onClickedPickImage,
        child: Text(
            'Pick Image',
            style: GoogleFonts.raleway(
                fontSize: 17,
                fontWeight: FontWeight.w600
            )
        ),
      ),
      const SizedBox(width: 12),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.lightBlue,
        ),
        onPressed: onClickedScanText,
        child: Text(
            'Scan For Text',
            style: GoogleFonts.raleway(
                fontSize: 17,
                fontWeight: FontWeight.w600
            )
        ),
      ),
      const SizedBox(width: 12),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.lightBlue,
        ),
        onPressed: onClickedClear,
        child: Text(
            'Clear',
            style: GoogleFonts.raleway(
                fontSize: 17,
                fontWeight: FontWeight.w600
            )
        ),
      )
    ],
  );
}