class UserObject {
  int id;
  String name;

  UserObject({
    required this.id,
    required this.name,
  });

  factory UserObject.fromMap(Map<String, dynamic> map) {
    return UserObject(
      id: map['id'],
      name: map['name'],
    );
  }
}
