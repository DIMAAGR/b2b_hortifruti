import 'package:b2b_hortifruti/core/remote_data/remote_data_failure.dart';
import 'package:b2b_hortifruti/modules/home/domain/entities/store_data_entity.dart';
import 'package:b2b_hortifruti/modules/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

abstract class IGetStoreDataUseCase {
  Future<Either<RemoteDataFailure, StoreDataEntity>> call();
}

class GetStoreDataUseCase implements IGetStoreDataUseCase {
  final IHomeRepository repository;

  GetStoreDataUseCase(this.repository);

  @override
  Future<Either<RemoteDataFailure, StoreDataEntity>> call() {
    return repository.fetchStoreData();
  }
}
