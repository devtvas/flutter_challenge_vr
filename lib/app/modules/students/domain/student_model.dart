import '../../../core/constants/constants.dart';

class StudentModel {
  int? id;
  String name;

  StudentModel({
    required this.id,
    required this.name,
  });
  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      studentsId: id,
      studentsName: name,
    };
    if (id != null) {
      map[studentsId] = id;
    }
    return map;
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map[studentsId],
      name: map[studentsName],
    );
  }
}
