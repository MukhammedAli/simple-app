import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp2/MainPage/settings.dart';
import 'package:myapp2/NewLogin/Login/shared/firebase_authentication.dart';

import '../colors.dart';

// TODO: CHANGE USERNAME, PHONE NUMB FUNCTIONALITY / CHANGE NULL IN PHONE NUMBER TO SOME DEFAULT VALUE // ADD ABOUT ME

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late PickedFile imageFile;
  bool _isEditingText = false;
  String newNum = "";
  String newName = "";
  int _sex = 1;
  final ImagePicker picker = ImagePicker();
  late TextEditingController myController = TextEditingController();
  bool showPassword = false;
  FirebaseAuthentication auth = FirebaseAuthentication();

  @override
  void initState() {
    super.initState();
    newNum = auth.getUserPhone();
    newName = auth.getUserName();
    if(auth.getUserSex() == 'Female'){
      _sex = 2;
    }
    else{
      _sex = 1;
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Widget userInfoPanel(
      String labelText, String userInfo) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText + " : ",
            style: TextStyle(
                color: Colors.white, fontSize: 15
            ),
          ),
          Text(
            userInfo,
            style: TextStyle(
              color: Colors.yellow, fontSize: 24
            )
          ),
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: topaz,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        color: (cllii.click == false) ? Colors.white : dark,
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 4,
                            color: (cllii.click == false) ? Colors.white : dark,
                          ),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color:
                                  (cllii.click == false) ? Colors.white : dark,
                            ),
                            color: Colors.green,
                          ),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: ((builder) => bottomSheet()),
                              );
                            },
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // TODO ADD ABOUT ME AND DO A PFP'S
              // Expanded(
              //   child: Container(
              //     height: 120,
              //     decoration: BoxDecoration(border: Border.all()),
              //     padding: EdgeInsets.all(8),
              //     alignment: Alignment.topLeft,
              //     child: SelectableText(
              //       "ABOUT ME: ",
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              const Text(
                "Name : ",
                style: TextStyle(
                    color: Colors.white, fontSize: 15
                ),
              ),
              changeName(),
              const Padding(
                padding: EdgeInsets.only(bottom: 25.0),
              ),
              userInfoPanel("E-mail", auth.getUserEmail().toString()),
              userInfoPanel("Joined Us", reformatDate(auth.getCreationTime().toString().substring(0,10))),
              const Text(
                "Phone : ",
                style: TextStyle(
                    color: Colors.white, fontSize: 15
                ),
              ),
              changePhone(),
              const Padding(
              padding: EdgeInsets.only(bottom: 25.0),
              ),
              const Text(
                "Sex : ",
                style: TextStyle(
                    color: Colors.white, fontSize: 15
                ),
              ),
            DropdownButtonHideUnderline(
              child: DropdownButton(
                dropdownColor: dark,
              value: _sex,
              items: const [
              DropdownMenuItem(
                child: Text(
                  "Male",
                    style: TextStyle(
                        color: Colors.yellow, fontSize: 24
                    )
                ),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text("Female",
                    style: TextStyle(
                        color: Colors.yellow, fontSize: 24
                    )
                ),
                value: 2,
              )],

              onChanged: (int? value) {
                setState(() {
                  _sex = value!;
                  if(_sex == 1){
                    auth.updateUserSex('Male', auth.getCurrentUser());
                  }
                  else{
                    auth.updateUserSex('Female', auth.getCurrentUser());
                  }
                });
              },),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            "Choose Profile photo",
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text("Gallery"),
              )
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      imageFile = pickedFile!;
    });
  }

  String reformatDate(String date){
    String day = date.substring(8,10);
    String month = date.substring(5,7);
    String year = date.substring(0,4);

    switch(month){
      case "1":
        month = "January";
        break;
      case "2":
        month = "February";
        break;
      case "3":
        month = "March";
        break;
      case "4":
        month = "April";
        break;
      case "5":
        month = "May";
        break;
      case "6":
        month = "June";
        break;
      case "7":
        month = "July";
        break;
      case "8":
        month = "August";
        break;
      case "9":
        month = "September";
        break;
      case "10":
        month = "October";
        break;
      case "11":
        month = "November";
        break;
      case "12":
        month = "December";
        break;
    }

    return month + " " + day + ", " + year;
  }

  showAlertDialog(BuildContext context, String type) {
    Text letter = Text("Your phone number contains letter!");
    Text length = Text("Your phone number length is incorrect!\n You can provide number in format +7 or 8");
    Text toShow = Text("");

    if(type == 'length'){
      toShow = length;
    }
    else{
      toShow = letter;
    }

    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Alert!"),
      content: toShow,
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  bool isNumRight(String phone){
    if(phone.contains('+', 0) && phone.length == 12 && !phone.contains(RegExp(r'[A-Z]')) && !phone.contains(RegExp(r'[a-z]'))) {
      auth.updateUserPhone(phone, auth.getCurrentUser());
      return true;
    }
    else if(phone.contains('8', 0) && phone.length == 11 && !phone.contains(RegExp(r'[A-Z]')) && !phone.contains(RegExp(r'[a-z]'))){
      auth.updateUserPhone(phone, auth.getCurrentUser());
      return true;
    }
    else if(phone.contains(RegExp(r'[A-Z]')) || phone.contains(RegExp(r'[a-z]'))){
      showAlertDialog(context, 'letter');
      return false;
    }
    showAlertDialog(context, 'length');
    return false;
  }

  Widget changePhone() {
    myController = TextEditingController(text: newNum);
    if (_isEditingText) {
      return Center(
        child: TextField(
          onSubmitted: (newValue){
            setState(() {
              if(isNumRight(newValue)) {
                newNum = newValue;
              }
              _isEditingText = false;
            });
          },
          autofocus: true,
          style: TextStyle(
              color: Colors.yellow, fontSize: 24
          ),
          controller: myController,
        ),
      );
    }
    return InkWell(
        onTap: () {
      setState(() {
        _isEditingText = true;
      });
    },
    child:
    Text(
      newNum,
      style: TextStyle(
          color: Colors.yellow, fontSize: 24
      ),
    ));
  }

  Widget changeName() {
    myController = TextEditingController(text: newName);
    if (_isEditingText) {
      return Center(
        child: TextField(
          onSubmitted: (newValue){
            setState(() {
              newName = newValue;
              auth.updateUserName(newName, auth.getCurrentUser());
              _isEditingText = false;
            });
          },
          autofocus: true,
          style: TextStyle(
              color: Colors.yellow, fontSize: 24
          ),
          controller: myController,
        ),
      );
    }
    return InkWell(
        onTap: () {
          setState(() {
            _isEditingText = true;
          });
        },
        child:
        Text(
          newName,
          style: TextStyle(
              color: Colors.yellow, fontSize: 24
          ),
        ));
  }
}
