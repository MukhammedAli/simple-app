import 'package:flutter/material.dart';
import 'package:myapp2/BauncyPageRoute.dart';
import 'package:myapp2/MainPage/choose.dart';
import 'package:myapp2/login/constants.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/log_in.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          'SIGN IN',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontSize: 16,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 16.0),
                            child: Icon(
                              Icons.alternate_email,
                              color: kPrimaryColor,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: kBackgroundColor),
                              decoration: InputDecoration(
                                hintText: 'Email Address',
                                fillColor: kPrimaryColor,
                                filled: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: const [
                    //     Padding(
                    //       padding: EdgeInsets.only(right: 16.0),
                    //       child: Icon(
                    //         Icons.lock,
                    //         color: kPrimaryColor,
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: TextField(
                    //         style: TextStyle(color: kBackgroundColor),
                    //         decoration: InputDecoration(
                    //           hintText: 'Password',
                    //           fillColor: kPrimaryColor,
                    //           filled: true,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.white.withOpacity(.5)),
                            ),
                            child: Icon(
                              Icons.android,
                              color: Colors.white.withOpacity(.5),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.white.withOpacity(.5)),
                            ),
                            child: Icon(
                              Icons.chat,
                              color: Colors.white.withOpacity(.5),
                            ),
                          ),
                          const Spacer(),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  BouncyPageRoute(
                                      widget: const ListOfWidgets()));
                            },
                            padding: const EdgeInsets.all(16),
                            // shape: BoxShape.circle,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(color: kPrimaryColor)),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
