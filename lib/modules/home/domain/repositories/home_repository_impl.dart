import 'package:b2b_hortifruti/core/remote_data/remote_data_failure.dart';
import 'package:b2b_hortifruti/modules/home/data/remote_data_source/home_remote_data_source.dart';
import 'package:b2b_hortifruti/modules/home/domain/entities/store_data_entity.dart';
import 'package:b2b_hortifruti/modules/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final IHomeRemoteDataSource dataSource;

  HomeRepositoryImpl(this.dataSource);

  @override
  Future<Either<RemoteDataFailure, StoreDataEntity>> fetchStoreData() async {
    try {
      final data = await dataSource.fetchStoreData();
      return Right(data.toEntity());
    } catch (e) {
      return Left(RemoteDataFailure(message: 'Something went wrong!'));
    }
  }
}
