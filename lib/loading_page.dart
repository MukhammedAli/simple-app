import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.all_inclusive_rounded,
            color: Colors.purple,
            size: 50.0,
          ),
          Center(
            child: FlatButton(
              onPressed: () async {
                Navigator.pushNamed(context, '/second');
              },
              child: const Text(
                'Simple App',
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.purple,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            'Bunch of useful apps',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15.0,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
