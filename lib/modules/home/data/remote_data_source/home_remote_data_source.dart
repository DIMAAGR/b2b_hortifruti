import '../models/store_data_model.dart';

abstract class IHomeRemoteDataSource {
  Future<StoreDataModel> fetchStoreData();
}
