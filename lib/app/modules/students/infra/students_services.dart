import '../../../core/database/students/database_students.dart';

class DatabaseStudentsServices {
  final dbHelper = DatabaseStudents.instance;

  Future insertItem(Map<String, dynamic> map, String tableName) async {
    return await dbHelper.insert(map, tableName);
  }

  Future updateItem(Map<String, dynamic> map, String tableName) async {
    return await dbHelper.update(map, tableName);
  }

  Future deleteItem(int id, String tableName) async {
    return await dbHelper.delete(id, tableName);
  }
}
