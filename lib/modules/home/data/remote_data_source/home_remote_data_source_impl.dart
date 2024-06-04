import 'dart:math';

import 'package:b2b_hortifruti/core/remote_data/exceptions/simulation_time_out_exception.dart';
import 'package:b2b_hortifruti/modules/home/data/models/store_data_model.dart';
import 'package:b2b_hortifruti/modules/home/data/remote_data_source/home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements IHomeRemoteDataSource {
  // SIMULAÇÃO
  @override
  Future<StoreDataModel> fetchStoreData() {
    return Future.delayed(
      const Duration(seconds: 3),
      () async {
        int random = Random.secure().nextInt(3) + 1;

        if (random == 1) {
          return StoreDataModel.fromJson(
            {'name': 'Mercearia Dois Irmãos', 'cnpj': '07.666.444/7773-29'},
          );
        } else if (random == 2) {
          return StoreDataModel.fromJson(
            {'name': 'Mercadinho Maristela', 'cnpj': '05.892.738/0001-24'},
          );
        } else {
          throw SimulationTimeOutException();
        }
      },
    );
  }
}
