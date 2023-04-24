import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_soft/app/modules/courses/courses_module.dart';
import 'package:vr_soft/app/modules/students/students_module.dart';

import 'modules/home/home_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute('/splash/', module: SplashModule()),
    ModuleRoute('/home/', module: HomeModule()),
    ModuleRoute('/students/', module: StudentsModule()),
    ModuleRoute('/courses/', module: CoursesModule()),
  ];
}
