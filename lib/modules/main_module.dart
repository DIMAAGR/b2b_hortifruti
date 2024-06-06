import 'package:b2b_hortifruti/core/remote_data/api/endpoints.dart';
import 'package:b2b_hortifruti/core/remote_data/api/endpoints_impl.dart';
import 'package:b2b_hortifruti/core/remote_data/api/remote_api.dart';
import 'package:b2b_hortifruti/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainModule extends Module {
  @override
  void binds(i) {
    i.add(RemoteAPI.new);
    i.addSingleton<Endpoints>(EndpointsImpl.new);
  }

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: HomeModule());
  }
}
 