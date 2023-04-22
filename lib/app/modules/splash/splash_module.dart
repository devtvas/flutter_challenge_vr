import 'package:flutter_modular/flutter_modular.dart';

import '../../core/config/app_routes.dart';
import 'presenter/splash_page.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => const SplashPage()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(AppRoute.initialRoute,
        child: (_, args) => const SplashPage(),
        transition: TransitionType.scale),
  ];
}
