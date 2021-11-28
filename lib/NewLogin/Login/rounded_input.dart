import 'package:flutter/material.dart';
import 'field_container.dart';

class RoundedInputField extends StatelessWidget {
  // final TextEditingController? txtUserName;
  final String? hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  const RoundedInputField({
    Key? key,
    //   this.txtUserName,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FieldContainer(
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        //     controller: txtUserName,
        onChanged: onChanged,
        validator: (text) => text!.isEmpty ? 'User Name is required' : '',
        decoration: InputDecoration(
            icon: Icon(icon), hintText: hintText, border: InputBorder.none),
      ),
    );
  }
}
