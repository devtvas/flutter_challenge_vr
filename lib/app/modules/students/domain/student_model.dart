import '../../../core/constants/constants.dart';

class StudentModel {
  String name;

  StudentModel({
    required this.name,
  });
  Map<String, dynamic> toMap() {
    return {
      studentsName: name,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      name: map['name'],
    );
  }
}
