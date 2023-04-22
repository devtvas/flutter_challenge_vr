import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vr_soft/app/core/database/database_students.dart';

import '../../../core/utils/validator.dart';
import '../../../core/widgets/card_widget.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../../../core/widgets/my_box_widget.dart';
import '../../../core/widgets/text_button_widget.dart';
import '../../../core/widgets/text_field_widget.dart';
import '../domain/student_model.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController nameController = TextEditingController();
  final dbHelper = DatabaseStudents.instance;

  final _formKey = GlobalKey<FormState>();

  bool insertSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Content'),
        leading: IconButtonWidget(
            iconData: Icons.arrow_back_sharp,
            onTap: () => Navigator.of(context).pop(insertSuccess)),
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
                      log('$studentModel');
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
