import 'package:dartz/dartz.dart';

import '../../../../core/remote_data/remote_data_failure.dart';
import '../entities/store_data_entity.dart';

abstract class IHomeRepository {
  Future<Either<RemoteDataFailure, StoreDataEntity>> fetchStoreData();
}
