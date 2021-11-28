import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/NewLogin/Login/background_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp2/BauncyPageRoute.dart';
import 'package:myapp2/MainPage/choose.dart';
import 'package:myapp2/NewLogin/Login/body_widget.dart';
import 'package:myapp2/NewLogin/Login/login_screen.dart';
import 'package:myapp2/login/login.dart';
import 'background_widget.dart';
import 'rounded_input.dart';
import 'rounded_password.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BodyWidgetRegistration extends StatefulWidget {
  const BodyWidgetRegistration({Key? key}) : super(key: key);

  @override
  _BodyWidgetRegistrationState createState() => _BodyWidgetRegistrationState();
}

class _BodyWidgetRegistrationState extends State<BodyWidgetRegistration> {
  final _auth = FirebaseAuth.instance;
  String _email = "";
  String _password = "";
  // @override
  // void initState() {
  //   super.initState();
  //   Firebase.initializeApp().whenComplete(() {
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundWidget(
        child: ListView(
          padding: EdgeInsets.only(top: 110),
          children: [
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("REGISTER",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset(
                    "assets/icons/iconregister.svg",
                    height: size.height * 0.35,
                  ),
                  RoundedInputField(
                    // txtUserName: txtUserName,
                    hintText: "Your email",
                    onChanged: (value) {
                      _email = value;
                    },
                  ),
                  RoundedPasswordField(
                    // txtPassword: txtPassword,
                    onChanged: (value) {
                      _password = value;
                    },
                  ),
                  RoundedPasswordField(
                      //txtPassword: txtPassword,
                      // onChanged: (value) {
                      //   _password = value;
                      // },
                      ),
                  RoundedButton(
                      text: "REGISTER",
                      color: Color(0xFF0288D1),
                      press: () async {
                        // print(_email);
                        // print(_password);

                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: _email, password: _password);
                          if (newUser != null) {
                            Navigator.push(context,
                                BouncyPageRoute(widget: LoginScreen()));
                          }
                        } catch (e) {
                          print(e);
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
        firstImage: "assets/images/ellipseregister.png",
        secondImage: "assets/images/ellipseregister2.png",
      ),
    );
  }
}

class RoundedButton extends StatefulWidget {
  final String? text;
  final Function? press;
  final Color? color, textColor;

  const RoundedButton({
    Key? key,
    this.text,
    this.press,
    this.color,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  //String _message = "";
  //final bool _isLogin = false;
  // void _showToast(BuildContext context) {
  //   final scaffold = ScaffoldMessenger.of(context);
  //   scaffold.showSnackBar(
  //     SnackBar(
  //         content: Text(_message),
  //         action: SnackBarAction(
  //           label: 'UNDO',
  //           onPressed: scaffold.hideCurrentSnackBar,
  //         )),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        // ignore: deprecated_member_use
        child: FlatButton(
            color: widget.color,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            onPressed: () {
              setState(() {
                widget.press!();
              });
            },
            // String userId = '';
            // if (_isLogin != false) {
            //   auth
            //       .createUser(txtUserName.text, txtPassword.text)
            //       .then((value) {
            //     if (value == null) {
            //       setState(() {
            //         _message = 'Registration Error';
            //       });
            //     } else {
            //       userId = value;
            //       setState(() {
            //         _message = 'User $userId successfull signed in';
            //         Navigator.push(
            //             (context), BouncyPageRoute(widget: BodyWidget()));
            //       });
            //     }
            //   });
            // }
            // ;

            // Navigator.push(
            //     context, BouncyPageRoute(widget: const ListOfWidgets()));

            // ignore: non_constant_identifier_names
            // RegExp regex_pass =
            //     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
            // // should contain at least one upper case
            // // should contain at least one lower case
            // // should contain at least one digit

            // // ignore: non_constant_identifier_names
            // RegExp regex_email = RegExp(
            //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
            // // ignore: unnecessary_null_comparison
            // if ((_email == null || _email.isEmpty) ||
            //     // ignore: unnecessary_null_comparison
            //     (_password == null || _password.isEmpty)) {
            //   // ignore: avoid_print
            //   print('Some text fields are empty');
            // } else {
            //   if (!regex_pass.hasMatch(_password) ||
            //       !regex_email.hasMatch(_email)) {
            //     // ignore: avoid_print
            //     print('Enter valid email or password');
            //   } else {
            //   }
            // }
            //_showToast(context);

            child: Text(widget.text!,
                style: const TextStyle(color: Colors.white))),
      ),
    );
  }
}
