import 'package:b2b_hortifruti/modules/home/data/remote_data_source/home_remote_data_source.dart';
import 'package:b2b_hortifruti/modules/home/data/remote_data_source/home_remote_data_source_impl.dart';
import 'package:b2b_hortifruti/modules/home/domain/repositories/home_repository.dart';
import 'package:b2b_hortifruti/modules/home/domain/repositories/home_repository_impl.dart';
import 'package:b2b_hortifruti/modules/home/domain/use_cases/get_market_data_use_case.dart';
import 'package:b2b_hortifruti/modules/home/domain/use_cases/get_store_data_use_case.dart';
import 'package:b2b_hortifruti/modules/home/presentation/controller/home_controller.dart';
import 'package:b2b_hortifruti/modules/home/presentation/home_presentation.dart';
import 'package:b2b_hortifruti/modules/main_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [MainModule()];

  void _controllers(Injector i) {
    i.addLazySingleton(HomeController.new);
  }

  void _repository(Injector i) {
    i.add<IHomeRepository>(HomeRepositoryImpl.new);
  }

  void _remoteDataSource(Injector i) {
    i.add<IHomeRemoteDataSource>(HomeRemoteDataSourceImpl.new);
  }

  void _useCases(Injector i) {
    i.add<IGetStoreDataUseCase>(GetStoreDataUseCase.new);
    i.add<IGetMarketDataUseCase>(GetMarketDataUseCase.new);
  }

  @override
  void binds(i) {
    _controllers(i);
    _remoteDataSource(i);
    _repository(i);
    _useCases(i);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => HomePresentation(
        controller: Modular.get<HomeController>(),
        search: r.args.queryParams['search'],
      ),
    );
  }
}
