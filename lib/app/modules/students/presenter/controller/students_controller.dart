import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/database/students/database_students.dart';
import '../../domain/student_model.dart';
import '../../infra/students_services.dart';
part 'students_controller.g.dart';

class StudentsController = _StudentsControllerBase with _$StudentsController;

abstract class _StudentsControllerBase with Store {
  _StudentsControllerBase({required this.databaseStudentsServices}) : super() {
    getData();
  }
  final DatabaseStudentsServices databaseStudentsServices;
  final StudentModel studentModel = StudentModel(name: '', id: null);
  final dbHelper = DatabaseStudents.instance;

  @observable
  List<StudentModel> _studentModelList = [];

  @computed
  List<StudentModel> get studentModelList => _studentModelList;

  Future insertStudent({required String name}) async {
    StudentModel studentModel = StudentModel(name: name, id: null);
    try {
      var result = databaseStudentsServices.insertItem(
          studentModel.toMap(), tableStudents);
      print(result);
    } catch (e) {
      log('$e');
    }
  }

  // Future<bool> getSearchList(String searchText) async {
  //   final data = await databaseStudents.getSearchList(searchText);
  //   if (data.isNotEmpty) {
  //     setState(() {
  //       _studentModelList = data;
  //       isSearch = true;
  //     });
  //     return true;
  //   }
  //   return false;
  // }

  void getList() async {
    _studentModelList.clear();
    final List<Map<String, dynamic>> maps =
        await databaseStudentsServices.queryAllRows(tableStudents);
    List.generate(maps.length, (i) {
      return _studentModelList.add(StudentModel(
        id: maps[i]['id'],
        name: maps[i]['name'],
      ));
    });
    print(studentModelList.first);
  }

  void getData() async {
    try {
      getList();
    } catch (e) {}
  }
}
