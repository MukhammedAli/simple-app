import 'package:flutter/material.dart';
import 'screens/taskscreen.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(const NoteApp());

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TasksScreen());
  }
}
