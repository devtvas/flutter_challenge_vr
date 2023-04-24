import 'package:flutter_modular/flutter_modular.dart';

import 'infra/courses_services.dart';
import 'presenter/controller/courses_controller.dart';
import 'presenter/courses_add_page.dart';
import 'presenter/courses_page.dart';

class CoursesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => CoursesController(coursesServices: CoursesServices()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const CoursesPage()),
    ChildRoute('/courses', child: (_, args) => const CoursesPage()),
    ChildRoute('/coursesAdd', child: (_, args) => const CoursesAddPage()),
  ];
}
