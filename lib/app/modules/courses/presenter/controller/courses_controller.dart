import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/database/courses/courses_database.dart';
import '../../domain/courses_model.dart';
import '../../infra/courses_services.dart';
part 'courses_controller.g.dart';

class CoursesController = _CoursesControllerBase with _$CoursesController;

abstract class _CoursesControllerBase with Store {
  _CoursesControllerBase({required this.coursesServices}) : super() {
    getData();
  }
  final CoursesServices coursesServices;
  final CoursesModel coursesModel =
      CoursesModel(id: null, name: '', description: '', ementa: '');
  final dbHelper = CoursesDatabase.instance;

  @observable
  List<CoursesModel> _coursesModelList = [];

  @computed
  List<CoursesModel> get coursesModelList => _coursesModelList;

  Future insertItem({required String name}) async {
    CoursesModel coursesModel =
        CoursesModel(id: null, name: name, description: '', ementa: '');
    try {
      var result =
          coursesServices.insertItem(coursesModel.toMap(), tableCourses);
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
  @action
  Future getList() async {
    _coursesModelList.clear();
    try {
      final List<Map<String, dynamic>> maps =
          await coursesServices.queryAllRows(tableCourses);
      _coursesModelList = List.generate(maps.length, (i) {
        return CoursesModel(
          id: maps[i]['id'],
          name: maps[i]['name'],
          description: maps[i]['description'],
          ementa: maps[i]['ementa'],
        );
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void getData() async {
    try {
      getList();
    } catch (e) {}
  }
}
