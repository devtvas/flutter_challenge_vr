// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        title: 'Flutter modular with Mobx',
        theme: ThemeData(
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(primary: const Color(0xFFF1A040)),
            ),
            // fontFamily: AppFonts.madeTommy,
            textTheme: const TextTheme(
                bodyText1: TextStyle(color: Colors.black
                    // fontFamily: AppFonts.madeTommy,
                    ))),
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        locale: const Locale('pt', 'BR')
        // localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
        // supportedLocales: const [
        //   Locale('en'),
        //   Locale('fr'),
        //   Locale('pt'),
        // ],
        );
  }
}
