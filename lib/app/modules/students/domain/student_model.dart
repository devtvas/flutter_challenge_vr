class StudentModel {
  int id;
  String name;

  StudentModel({
    required this.id,
    required this.name,
  });

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'],
      name: map['name'],
    );
  }
}
