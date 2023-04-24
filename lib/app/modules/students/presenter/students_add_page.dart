import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/widgets/card_widget.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../../../core/widgets/my_box_widget.dart';
import '../../../core/widgets/text_button_widget.dart';
import '../../../core/widgets/text_field_widget.dart';
import 'controller/students_controller.dart';

class StudentsAddPage extends StatefulWidget {
  const StudentsAddPage({Key? key}) : super(key: key);

  @override
  State<StudentsAddPage> createState() => _StudentsAddPageState();
}

class _StudentsAddPageState extends State<StudentsAddPage> {
  StudentsController studentsController = Modular.get<StudentsController>();

  TextEditingController nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool insertSuccess = false;

  @override
  void initState() {
    super.initState();
  }

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
      body: Observer(
        builder: (context) {
          return SingleChildScrollView(
            child: CardWidget(
              child: Column(
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFieldWidget(
                              controller: nameController, name: 'Name'),
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
                        studentsController
                            .insertStudent(
                          name: nameController.text,
                        )
                            .then(
                          (value) {
                            studentsController.getData();

                            Modular.to.pop();
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
