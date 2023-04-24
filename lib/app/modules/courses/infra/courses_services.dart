import '../../../core/database/courses/courses_database.dart';

class CoursesServices {
  final dbHelper = CoursesDatabase.instance;

  Future insertItem(Map<String, dynamic> map, String tableName) async {
    return await dbHelper.insert(map, tableName);
  }

  Future queryAllRows(String tableName) async {
    return await dbHelper.queryAllRows(tableName);
  }

  Future updateItem(Map<String, dynamic> map, String tableName) async {
    return await dbHelper.update(map, tableName);
  }

  Future deleteItem(int id, String tableName) async {
    return await dbHelper.delete(id, tableName);
  }
}
