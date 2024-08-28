import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  // TaskList({super.key});
  String data = "";
  @override
  Widget build(BuildContext context) {
    return Text(data);
  }

  TaskList(String data) {
    this.data = data;
  }
}
