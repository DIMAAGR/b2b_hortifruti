import 'package:b2b_hortifruti/core/remote_data/remote_data_failure.dart';
import 'package:b2b_hortifruti/modules/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/market_data_entity.dart';

abstract class IGetMarketDataUseCase {
  Future<Either<RemoteDataFailure, MarketDataEntity>> call([Map<String, dynamic>? params]);
}

class GetMarketDataUseCase implements IGetMarketDataUseCase {
  final IHomeRepository repository;

  GetMarketDataUseCase(this.repository);

  @override
  Future<Either<RemoteDataFailure, MarketDataEntity>> call([Map<String, dynamic>? params]) {
    return repository.fetchMarketData(params);
  }
}
