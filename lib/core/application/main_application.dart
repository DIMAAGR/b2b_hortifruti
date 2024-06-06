import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Modular.routerConfig,
      title: 'B2B Hortifruti - Yandeh',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    );
  }
}
