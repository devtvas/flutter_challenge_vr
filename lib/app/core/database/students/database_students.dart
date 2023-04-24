import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../../modules/home/domain/user_object.dart';
import '../../constants/constants.dart';
import 'package:path/path.dart';

class DatabaseStudents {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  DatabaseStudents._privateConstructor();
  static final DatabaseStudents instance =
      DatabaseStudents._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Get the device's file path and store the database
  // Open the database and create the tables using raw sql
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (Database db, int version) async {
        await db.execute('''
              CREATE TABLE $tableStudents (
                $studentsId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                $studentsName TEXT NOT NULL
              )
              ''');
      },
    );
  }

  // Insert a row as map where each key in the map is a column name and value is a column value.
  // The return value is the id of inserted row.
  Future<int> insert(Map<String, dynamic> row, String tableName) async {
    Database db = await instance.database;
    return await db.insert(tableName, row,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Get all the rows and returned as a list of maps, where each map is a key-value pair of columns.
  Future<List<Map<String, dynamic>>> queryAllRows(
    String tableName,
  ) async {
    Database db = await instance.database;
    return await db.query(tableName);
  }

  // Pass table name and the specific row that you want to update.
  // Update that row by id
  Future<int> update(Map<String, dynamic> row, String tableName) async {
    Database db = await instance.database;
    int id = row[studentsId];
    return await db
        .update(tableName, row, where: '$studentsId = ?', whereArgs: [id]);
  }

  // Provide table name and column id that you want to delete.
  // Delete the row by id
  Future<int> delete(int id, String tableName) async {
    Database db = await instance.database;
    return await db.delete(
      tableName,
      where: '$studentsId = ?',
      whereArgs: [id],
    );
  }

  Future<UserObject?> getLogin(
      {required String contact, required String password}) async {
    Database db = await instance.database;
    var res = await db.rawQuery(
        "SELECT * FROM $tableStudents WHERE contact = '$contact' and password = '$password'");
    if (res.length > 0) {
      return UserObject.fromMap(res.first);
    }
    return null;
  }

  // Search all the rows in tbl_content table by keyword.
  Future<List<Map<String, dynamic>>> getSearchList(String searchText) async {
    Database db = await instance.database;
    return await db.rawQuery(
      'SELECT * FROM $tableStudents WHERE $studentsName LIKE ? ',
      ['%' + searchText + '%', '%' + searchText + '%'],
    );
  }
}
