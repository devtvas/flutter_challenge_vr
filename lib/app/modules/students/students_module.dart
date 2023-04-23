import 'package:flutter_modular/flutter_modular.dart';

import 'infra/students_services.dart';
import 'presenter/controller/students_controller.dart';
import 'presenter/students_add_page.dart';
import 'presenter/students_page.dart';

class StudentsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => StudentsController(
        databaseStudentsServices: DatabaseStudentsServices()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const StudentsPage()),
    ChildRoute('/students', child: (_, args) => const StudentsPage()),
    ChildRoute('/studentsAdd', child: (_, args) => const StudentsAddPage()),
  ];
}
