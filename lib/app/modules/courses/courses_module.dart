import 'package:flutter_modular/flutter_modular.dart';

class CoursesModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    // ChildRoute('/', child: (_, args) => const HomePage(title: 'HomePage')),
  ];
}
