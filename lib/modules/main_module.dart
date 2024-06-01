import 'package:b2b_hortifruti/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: HomeModule());
  }
}
