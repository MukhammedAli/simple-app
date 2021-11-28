import 'package:flutter/material.dart';
import 'field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  //final TextEditingController? txtPassword;

  RoundedPasswordField({
    Key? key,
    //this.txtPassword,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FieldContainer(
        child: TextFormField(
      //controller: txtPassword,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      onChanged: onChanged,
      decoration: const InputDecoration(
          hintText: 'Password',
          icon: Icon(
            Icons.lock,
          ),
          suffixIcon: Icon(
            Icons.visibility,
          ),
          border: InputBorder.none),
      //validator: (text) => text!.isEmpty ? 'Password is requried' : '',
    ));
  }
}
