import '../domain/user_model.dart';

abstract class IHomeRepository {
  Future<List<UserModel>> getUsers();
}

class HomeRepository implements IHomeRepository {
  @override
  Future<List<UserModel>> getUsers() async {
    await Future.delayed(Duration(seconds: 1));
    return <UserModel>[
      UserModel(name: 'Rob'),
      UserModel(name: 'Jess'),
      UserModel(name: 'Call'),
      UserModel(name: 'Bill'),
    ];
  }
}
