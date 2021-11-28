import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:myapp2/BauncyPageRoute.dart';
import 'package:myapp2/MainPage/choose.dart';
import 'package:myapp2/NewLogin/Login/shared/firebase_authentication.dart';
import 'background_widget.dart';
import 'rounded_input.dart';
import 'rounded_password.dart';

String firstAsset = "";
String secondAsset = "";

final TextEditingController txtUserName = TextEditingController();
final TextEditingController txtPassword = TextEditingController();

class BodyWidget extends StatefulWidget {
  @override
  BodyWidgetState createState() => BodyWidgetState();
}

class BodyWidgetState extends State<BodyWidget> {
  bool showSpinner = false;
  final authSend = FirebaseAuth.instance;
  String email = "";
  String password = "";
  // BodyWidgetState({
  //   Key? key,
  // }) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  // @override
  // void initState() {
  //   Firebase.initializeApp().whenComplete(() {
  //     _auth = FirebaseAuthentication();
  //     setState(() {});
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    firstAsset = "assets/images/ending.png";
    secondAsset = "assets/images/ellipseforlog2.png";
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Form(
          key: formKey,
          child: BackgroundWidget(
            child: ListView(
              padding: EdgeInsets.only(top: 110),
              children: [
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("LOG IN",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      SvgPicture.asset(
                        "assets/icons/svgfornewlog.svg",
                        height: size.height * 0.35,
                      ),
                      RoundedInputField(
                        // txtUserName: txtUserName,
                        hintText: "Your email",
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      RoundedPasswordField(
                        //txtPassword: txtPassword,
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                      RoundedButton(
                        text: "LOGIN",
                        press: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          try {
                            final user =
                                await authSend.signInWithEmailAndPassword(
                                    email: email, password: password);
                            if (user != null) {
                              Navigator.push(
                                  context,
                                  BouncyPageRoute(
                                      widget: const ListOfWidgets()));
                            }
                            setState(() {
                              showSpinner = false;
                            });
                          } catch (e) {}
                          ;
                        },
                        color: Colors.blueAccent,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Don't have an Accounnt?",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold)),
                            Text("Sign in",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            firstImage: firstAsset,
            secondImage: secondAsset,
          ),
        ),
      ),
    );
  }
}

class RoundedButton extends StatefulWidget {
  final String? text;
  final Function? press;
  final Color? color, textColor;

  //FirebaseAuth authSend;

  const RoundedButton({
    Key? key,
    this.text,
    // required this.email,
    // required this.password,
    // required this.authSend,
    this.press,
    this.color,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  String _message = "";
  //final _auth = FirebaseAuth.instance;
  final bool _isLogin = true;
  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
          content: Text(_message),
          action: SnackBarAction(
            label: 'UNDO',
            onPressed: scaffold.hideCurrentSnackBar,
          )),
    );
  }

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
            // if (_isLogin) {
            //   auth.login(txtUserName.text, txtPassword.text).then((value) {
            //     if (value == null) {
            //       setState(() {
            //         _message = 'Login Error';
            //       });
            //     } else {
            //       userId = value;
            //       setState(() {
            //         _message = 'User $userId successfull logged in';
            //         Navigator.push((context),
            //             BouncyPageRoute(widget: const ListOfWidgets()));
            //       });
            //     }
            //   });
            // }
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
            // _showToast(context);

            child: Text(widget.text!,
                style: const TextStyle(color: Colors.white))),
      ),
    );
  }
}
