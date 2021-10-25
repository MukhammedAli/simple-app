import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.all_inclusive_rounded,
            color: Colors.amber,
            size: 50.0,
          ),
              Center(
                child: Text(
                'Simple App',
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.amber,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
            ),
          ),
              ),
          SizedBox(height: 5.0),
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
