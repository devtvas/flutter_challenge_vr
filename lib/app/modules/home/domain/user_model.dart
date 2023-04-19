// import 'import 'package:mobx/mobx.dart';

class UserModel {
  final String? name;
  final String? cpf;
  final String? idade;
  final String? endereco;

  UserModel({
    this.name,
    this.cpf,
    this.idade,
    this.endereco,
  });

  copyWith() {
    return UserModel(
        name: name ?? this.name,
        cpf: cpf ?? this.cpf,
        idade: idade ?? this.idade,
        endereco: endereco ?? this.endereco);
  }
}
