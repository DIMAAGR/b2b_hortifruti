import 'package:b2b_hortifruti/core/application/main_application.dart';
import 'package:b2b_hortifruti/modules/main_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  await dotenv.load();
  runApp(ModularApp(module: MainModule(), child: const MainApp()));
}
