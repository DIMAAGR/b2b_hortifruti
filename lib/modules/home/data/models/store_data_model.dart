import 'package:b2b_hortifruti/modules/home/domain/entities/store_data_entity.dart';

class StoreDataModel {
  final String storeName;
  final String cnpj;

  StoreDataModel({required this.storeName, required this.cnpj});

  StoreDataEntity toEntity() {
    return StoreDataEntity(storeName: storeName, cnpj: cnpj);
  }

  factory StoreDataModel.fromEntity(StoreDataEntity entity) {
    return StoreDataModel(storeName: entity.storeName, cnpj: entity.cnpj);
  }

  factory StoreDataModel.fromJson(Map<String, dynamic> json) {
    return StoreDataModel(
      storeName: json['name'],
      cnpj: json['cnpj'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': storeName,
      'cnpj': cnpj,
    };
  }
}
