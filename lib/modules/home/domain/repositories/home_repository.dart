import 'package:b2b_hortifruti/modules/home/domain/entities/market_data_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/remote_data/remote_data_failure.dart';
import '../entities/store_data_entity.dart';

abstract class IHomeRepository {
  Future<Either<RemoteDataFailure, StoreDataEntity>> fetchStoreData();
  Future<Either<RemoteDataFailure, MarketDataEntity>> fetchMarketData([Map<String, dynamic>? params]);
}
