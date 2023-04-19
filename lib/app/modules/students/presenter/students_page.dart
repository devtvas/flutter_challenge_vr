import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../domain/student_model.dart';

const darkBlueColor = Color(0xff486579);

class StudentsPage extends StatelessWidget {
  final String title;
  StudentsPage({Key? key, required this.title}) : super(key: key);
  final StudentModel _studentModel = StudentModel(
    id: 0,
    name: "",
  );
  List<StudentModel> _studentList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            title,
            style: TextStyle(color: darkBlueColor),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[_form(), _list()],
        ),
      ),
    );
  }

  _form() => Text('form goes here');

  _list() => Text('list of contacts goes here');
}
