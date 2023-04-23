import '../../../core/constants/constants.dart';

class StudentModel {
  int id;
  String name;

  StudentModel({
    required this.id,
    required this.name,
  });
  Map<String, dynamic> toMap() {
    return {
      studentsId: id,
      studentsName: name,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'],
      name: map['name'],
    );
  }
}
