import 'package:b2b_hortifruti/core/remote_data/response.dart';
import 'package:b2b_hortifruti/modules/home/domain/entities/category_enum.dart';
import 'package:b2b_hortifruti/modules/home/domain/entities/market_data_entity.dart';
import 'package:b2b_hortifruti/modules/home/domain/use_cases/get_market_data_use_case.dart';
import 'package:b2b_hortifruti/modules/home/domain/use_cases/get_store_data_use_case.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/store_data_entity.dart';

class HomeController extends ChangeNotifier {
  final IGetStoreDataUseCase _getStoreDataUseCase;
  final IGetMarketDataUseCase _getMarketDataUseCase;

  HomeController(this._getStoreDataUseCase, this._getMarketDataUseCase);

  ValueNotifier<CategoryEnum> category = ValueNotifier(CategoryEnum.fruitsYandeh);
  ValueNotifier<ResponseData<MarketDataEntity>?> marketData = ValueNotifier(null);
  ValueNotifier<ResponseData<StoreDataEntity>?> userData = ValueNotifier(null);

  Future<void> getUserStoreData() async {
    final result = await _getStoreDataUseCase();

    userData.value = result.fold(
      (failure) => ResponseData.failure(failure.message),
      (data) => ResponseData.success(data),
    );

    notifyListeners();
  }

  Future<void> getMarketData([String? arguments]) async {
    marketData.value = null;
    final result = await _getMarketDataUseCase(arguments != null ? {'arguments': arguments} : null);


    marketData.value = result.fold(
      (failure) => ResponseData.failure(failure.message),
      (data) => ResponseData.success(data),
    );
  }
}
