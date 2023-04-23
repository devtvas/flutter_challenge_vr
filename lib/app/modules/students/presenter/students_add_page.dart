import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/database/students/database_students.dart';
import '../../../core/database/students/database_students_services.dart';
import '../../../core/widgets/card_widget.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../../../core/widgets/my_box_widget.dart';
import '../../../core/widgets/text_button_widget.dart';
import '../../../core/widgets/text_field_widget.dart';
import '../domain/student_model.dart';

class StudentsAddPage extends StatefulWidget {
  const StudentsAddPage({Key? key}) : super(key: key);

  @override
  State<StudentsAddPage> createState() => _StudentsAddPageState();
}

class _StudentsAddPageState extends State<StudentsAddPage> {
  TextEditingController nameController = TextEditingController();
  final dbHelper = DatabaseStudents.instance;

  final _formKey = GlobalKey<FormState>();

  bool insertSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Student'),
        leading: IconButtonWidget(
          iconData: Icons.arrow_back_sharp,
          color: const Color(0xFFF1A040),
          onTap: () => Navigator.of(context).pop(insertSuccess),
        ),
      ),
      body: SingleChildScrollView(
        child: CardWidget(
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFieldWidget(controller: nameController, name: 'Name'),
                      MyBoxWidget(),
                    ],
                  )),
              MyBoxWidget(
                height: 30,
              ),
              TextBtnWidget(
                  name: 'Save',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      StudentModel studentModel = StudentModel(
                        id: 0,
                        name: nameController.text,
                      );
                      log('${studentModel.name}');
                      DatabaseStudentsServices()
                          .insertItem(studentModel.toMap(), tableStudents)
                          .then((value) =>
                              Navigator.of(context).pop(insertSuccess));
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
