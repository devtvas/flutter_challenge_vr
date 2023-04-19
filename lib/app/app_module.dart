import 'package:flutter_modular/flutter_modular.dart';

import 'modules/courses/courses_module.dart';
import 'modules/home/home_module.dart';
import 'modules/students/students_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute('/home/', module: HomeModule()),
    ModuleRoute('/students/', module: StudentsModule()),
    ModuleRoute('/courses/', module: CoursesModule()),
  ];
}
