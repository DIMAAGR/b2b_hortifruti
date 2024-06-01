import 'package:b2b_hortifruti/modules/home/presentation/home_presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const HomePresentation());
  }
}
