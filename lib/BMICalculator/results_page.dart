import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsPage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ResultsPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 40,
        ),
        onPressed: () => Navigator.of(context).pop(),
        ),
      iconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
      title: Text(
        'BMI Calculator',
        style: GoogleFonts.raleway(
        fontSize: 40,
        fontWeight: FontWeight.w600
        ),
      ),
        backgroundColor: const Color(0xFF0A0E21),
        centerTitle: true,
      ),
      bottomNavigationBar: Material(
        color: Colors.pink,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SizedBox(
            height: 80,
            child: Center(
              child: Text(
                'RE-CALCULATE',
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold,
                    fontSize: 33,
                    color: Colors.white
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: const Text('Your results', style: kTitleTextStyle),
          )),
          Expanded(
              flex: 5,
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
