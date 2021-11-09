import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}
final List locale=[
  {'name':'ENGLISH','locale': Locale('en','US')},
  {'name':'RUSSION','locale': Locale('ru','RU')},

];
updateLanguage(Locale locale){
  Get.back();
  Get.updateLocale(locale);
}
builddialog(BuildContext context){
  showDialog(context: context, builder: (builder){
    return GestureDetector(
      onTap: (){
        AlertDialog(
          title: Text('Choose a language'),
          content: Container(
            width: double.maxFinite,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: (){
                          updateLanguage(locale[index]['locale']);
                        },
                        child: Text(locale[index]['name'])),
                  );
                },
                separatorBuilder: (context,index){
                  return Divider(
                    color: Colors.blue,
                  );
                },
                itemCount: locale.length),
          ),
        );
      },

    );
  });

}


class _SettingsState extends State<Settings> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
            'Settings'.tr,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
        toolbarHeight: 70,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Scrollbar(
          child: ListView(
            padding: EdgeInsets.only(left: 16, top: 25, right: 16),
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Account".tr,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              buildLanguageOptionRow(context, "Change_password".tr),
              buildAccountOptionRow(context, "Content_settings".tr),
              buildAccountOptionRow(context, "Background".tr),
              buildLanguageOptionRow(context, "Language".tr),
              buildAccountOptionRow(context, "Privacy".tr),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Icon(
                    Icons.volume_up_outlined,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Notifications".tr,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              buildNotificationOptionRow("New_for_you".tr, true),
              buildNotificationOptionRow("Account_activity".tr, true),
              buildNotificationOptionRow("Opportunity".tr, false),
              SizedBox(
                height: 50,
              ),
              Center(
                child: OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {},
                  child: Text("SIGN_OUT".tr,
                      style: TextStyle(
                          fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
                ),
              )
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
              color: Colors.grey[600]),
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
                  children: [
                    Text("Option 1"),
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
                color: Colors.grey[600],
              ),
            ),
            Icon(
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
              title: Text('Choose a language'),
              content: Container(
                width: double.maxFinite,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: (){
                              updateLanguage(locale[index]['locale']);
                            },
                            child: Text(locale[index]['name'])),
                      );
                    },
                    separatorBuilder: (context,index){
                      return Divider(
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
              color: Colors.grey[600],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          ),
        ],
      ),
    ),
  );
}