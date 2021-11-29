import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp2/NewLogin/Login/body_widget.dart';
import 'package:myapp2/NewLogin/welcome_page.dart';
import 'package:myapp2/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp2/login/login.dart';

import 'edit_profile.dart';

String _message = "";

class cllii {
  static bool click = true;
}

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

final List locale = [
  {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
  {'name': 'RUSSIAN', 'locale': Locale('ru', 'RU')},
];

updateLanguage(Locale locale) {
  Get.back();
  Get.updateLocale(locale);
}

// class _SettingsState extends State<Settings> {
//   Widget returnWidget() {
//     return Text(_message);
//   }
//
//   void _showToast(BuildContext context) {
//     final scaffold = ScaffoldMessenger.of(context);
//     scaffold.showSnackBar(
//       SnackBar(
//           content: Text(_message),
//           action: SnackBarAction(
//             label: 'UNDO',
//             onPressed: scaffold.hideCurrentSnackBar,
//           )),
//     );
//   }

class _SettingsState extends State<Settings> {
  final _auth = FirebaseAuth.instance;
  String backString = "Dark";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: topaz,
        title: Text(
          'Settings'.tr,
          style: GoogleFonts.raleway(
            fontSize: 40,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        toolbarHeight: 70,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: (cllii.click == false) ? Colors.white : dark,
        child: Scrollbar(
          child: ListView(
            padding: EdgeInsets.only(left: 16, top: 25, right: 16),
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Account".tr,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: (cllii.click == false)
                            ? Colors.black
                            : Colors.yellow),
                  ),
                ],
              ),
              const Divider(
                height: 15,
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              buildEditProfile(context, "Edit Profile".tr),
              buildAccountOptionRow(context, "Content settings".tr),
              backgroundRow(context, "Background".tr),
              buildLanguageOptionRow(context, "Language".tr),
              buildAccountOptionRow(context, "Privacy".tr),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.volume_up_outlined,
                    color: Colors.green,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Notifications".tr,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: (cllii.click == false)
                            ? Colors.black
                            : Colors.yellow),
                  ),
                ],
              ),
              const Divider(
                height: 15,
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              buildNotificationOptionRow("New for you".tr, true),
              buildNotificationOptionRow("Account activity".tr, true),
              buildNotificationOptionRow("Updates".tr, false),
              Center(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 1.0,
                            color: (cllii.click == false)
                                ? Colors.black
                                : Colors.white)),

                    // padding: EdgeInsets.symmetric(horizontal: 40),
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      _auth.signOut();
                      Navigator.pop(context);
                    },
                    child: Text("SIGN OUT".tr,
                        style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 2.2,
                            color: (cllii.click == false)
                                ? Colors.black
                                : Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: (cllii.click == false) ? Colors.black : Colors.grey[300]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "Option 1",
                    ),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close".tr)),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: (cllii.click == false) ? Colors.black : Colors.grey[300],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector backgroundRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: (cllii.click == false) ? Colors.white : dark,
                title: Text(
                  title,
                  style: TextStyle(
                    color: (cllii.click == false) ? Colors.black : Colors.white,
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OutlineButton(
                      child: Text(
                          (cllii.click == false)
                              ? backString = "Dark"
                              : backString = "Light",
                          style: TextStyle(
                            fontSize: 20,
                            color: (cllii.click == false)
                                ? Colors.black
                                : Colors.white,
                          )),
                      onPressed: () {
                        setState(() {
                          cllii.click = !cllii.click;
                        });
                      },
                    ),
                  ],
                ),
                actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Close".tr,
                      style: TextStyle(
                        color: (cllii.click == false)
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: (cllii.click == false) ? Colors.black : Colors.grey[300],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

GestureDetector buildLanguageOptionRow(BuildContext context, String title) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Choose a language'),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () {
                              updateLanguage(locale[index]['locale']);
                            },
                            child: Text(locale[index]['name'])),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: Colors.blue,
                      );
                    },
                    itemCount: locale.length),
              ),
            );
          });
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: (cllii.click == false) ? Colors.black : Colors.grey[300],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          ),
        ],
      ),
    ),
  );
}

GestureDetector buildEditProfile(BuildContext context, String title) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => EditProfilePage()));
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: (cllii.click == false) ? Colors.black : Colors.grey[300],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          ),
        ],
      ),
    ),
  );
}
