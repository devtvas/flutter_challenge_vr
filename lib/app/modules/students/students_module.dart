import 'package:flutter_modular/flutter_modular.dart';

import '../../core/config/app_routes.dart';
import 'presenter/add_page.dart';
import 'presenter/students_page.dart';

class StudentsModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      AppRoute.initialRoute,
      child: (_, args) => StudentsPage(),
      children: [
        ChildRoute(AppRoute.addStudentsPage,
            child: (context, args) => AddPage())
      ],
    ),
  ];
}
