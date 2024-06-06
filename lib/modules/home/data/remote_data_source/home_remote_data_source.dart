import '../models/market_data_model.dart';
import '../models/store_data_model.dart';

abstract class IHomeRemoteDataSource {
  Future<StoreDataModel> fetchStoreData();
  Future<MarketDataModel> fetchMarketData([Map<String, dynamic>? params]);
}
