import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp2/BauncyPageRoute.dart';
import 'package:myapp2/MainPage/choose.dart';
import 'background_widget.dart';
import 'rounded_input.dart';
import 'rounded_password.dart';

String _email = "";
String _password = "";

class BodyWidget extends StatelessWidget {
  BodyWidget({
    Key? key,
  }) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formKey,
        child: BackgroundWidget(
          child: ListView(
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
                      hintText: "Your email",
                      onChanged: (value) {
                        _email = value;
                      },
                    ),
                    RoundedPasswordField(
                      onChanged: (value) {
                        _password = value;
                      },
                    ),
                    const RoundedButton(
                      text: "LOGIN",
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
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        // ignore: deprecated_member_use
        child: FlatButton(
            color: color,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            onPressed: () {
              // ignore: non_constant_identifier_names

              Navigator.push(
                  context, BouncyPageRoute(widget: const ListOfWidgets()));
            },
            child: Text(text!, style: const TextStyle(color: Colors.white))),
      ),
    );
  }
}
