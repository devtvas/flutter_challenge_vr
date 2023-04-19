import 'package:mobx/mobx.dart';

import '../domain/user_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  @observable
  UserModel userModel = UserModel();
  //
  @observable
  int value = 0;
  //
  @computed
  String? get name => userModel.name;
  //
  @action
  void increment() {
    value++;
    userModel = userModel.copyWith();
  }
}
