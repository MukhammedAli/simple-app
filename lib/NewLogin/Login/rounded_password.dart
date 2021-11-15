import 'package:flutter/material.dart';
import 'FieldContainer.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const RoundedPasswordField({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FieldContainer(
        child: TextField(
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
    ));
  }
}
