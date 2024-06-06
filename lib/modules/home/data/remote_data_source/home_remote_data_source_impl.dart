import 'dart:math';

import 'package:b2b_hortifruti/core/remote_data/api/endpoints.dart';
import 'package:b2b_hortifruti/core/remote_data/exceptions/time_out_exception.dart';
import 'package:b2b_hortifruti/modules/home/data/models/market_data_model.dart';
import 'package:b2b_hortifruti/modules/home/data/models/store_data_model.dart';
import 'package:b2b_hortifruti/modules/home/data/remote_data_source/home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements IHomeRemoteDataSource {
  final Endpoints _endpoints;

  const HomeRemoteDataSourceImpl(this._endpoints);

  // SIMULAÇÃO
  @override
  Future<StoreDataModel> fetchStoreData() {
    return Future.delayed(
      const Duration(seconds: 3),
      () async {
        int random = Random.secure().nextInt(2) + 1;

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

  @override
  Future<MarketDataModel> fetchMarketData([Map<String, dynamic>? params]) async {
    return MarketDataModel.fromJson((await _endpoints.searchProducts(params)));
  }
}
