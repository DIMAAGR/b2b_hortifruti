import 'package:b2b_hortifruti/core/remote_data/response.dart';
import 'package:b2b_hortifruti/modules/home/domain/entities/category_enum.dart';
import 'package:b2b_hortifruti/modules/home/domain/use_cases/get_store_data_use_case.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final IGetStoreDataUseCase _getStoreDataUseCase;

  HomeController(this._getStoreDataUseCase);

  ValueNotifier<CategoryEnum> category = ValueNotifier(CategoryEnum.fruitsYandeh);
  ValueNotifier<ResponseData?> storeData = ValueNotifier(null);

  Future<void> getStoreData() async {
    final result = await _getStoreDataUseCase();

    storeData.value = result.fold(
      (failure) => ResponseData.failure(failure.message),
      (data) => ResponseData.success(data),
    );
    
    notifyListeners();
  }
}
