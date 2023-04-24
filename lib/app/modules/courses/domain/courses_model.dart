import '../../../core/constants/constants.dart';

class CoursesModel {
  int? id;
  String name;
  String description;
  String ementa;

  CoursesModel({
    required this.id,
    required this.name,
    required this.description,
    required this.ementa,
  });
  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      studentsId: id,
      studentsName: name,
      coursesDescription: description,
      coursesEmenta: ementa,
    };
    if (id != null) {
      map[coursesId] = id;
    }
    return map;
  }

  factory CoursesModel.fromMap(Map<String, dynamic> map) {
    return CoursesModel(
      id: map[coursesId],
      name: map[coursesName],
      description: map[coursesDescription],
      ementa: map[coursesEmenta],
    );
  }
}
