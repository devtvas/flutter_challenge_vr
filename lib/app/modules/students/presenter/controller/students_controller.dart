import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/database/students/database_students.dart';
import '../../domain/student_model.dart';
import '../../infra/students_services.dart';
part 'students_controller.g.dart';

class StudentsController = _StudentsControllerBase with _$StudentsController;

abstract class _StudentsControllerBase with Store {
  _StudentsControllerBase({required this.databaseStudentsServices}) : super();
  final DatabaseStudentsServices databaseStudentsServices;
  final StudentModel studentModel = StudentModel(name: '');
  final dbHelper = DatabaseStudents.instance;

  Future insertStudent({required String name}) async {
    StudentModel studentModel = StudentModel(name: name);
    try {
      var result = databaseStudentsServices.insertItem(
          studentModel.toMap(), tableStudents);
      print(result);
    } catch (e) {
      log('$e');
    }
  }
}
