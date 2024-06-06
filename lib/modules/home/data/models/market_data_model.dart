import 'package:b2b_hortifruti/modules/home/domain/entities/market_data_entity.dart' as entity;

class MarketDataModel {
  List<Sections>? sections;
  Candidate? candidate;

  MarketDataModel({this.sections, this.candidate});

  MarketDataModel.fromJson(Map<String, dynamic> json) {
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(Sections.fromJson(v));
      });
    }
    candidate = json['candidate'] != null ? Candidate.fromJson(json['candidate']) : null;
  }

  entity.MarketDataEntity toEntity() {
    return entity.MarketDataEntity(
      candidate: candidate?.toEntity(),
      sections: sections?.map((element) => element.toEntity()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sections != null) {
      data['sections'] = sections!.map((v) => v.toJson()).toList();
    }
    if (candidate != null) {
      data['candidate'] = candidate!.toJson();
    }
    return data;
  }
}

class Sections {
  String? section;
  String? description;
  List<Products>? products;

  Sections({this.section, this.description, this.products});

  Sections.fromJson(Map<String, dynamic> json) {
    section = json['section'];
    description = json['description'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  entity.Sections toEntity() {
    return entity.Sections(
      description: description,
      section: section,
      products: products?.map((element) => element.toEntity()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['section'] = section;
    data['description'] = description;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? sku;
  String? category;
  String? unitType;
  String? package;
  String? ean;
  double? unitContent;
  String? unitMessure;
  int? packageQuantity;
  String? price;

  Products(
      {this.id,
      this.name,
      this.sku,
      this.category,
      this.unitType,
      this.package,
      this.ean,
      this.unitContent,
      this.unitMessure,
      this.packageQuantity,
      this.price});

  entity.Products toEntity() {
    return entity.Products(
      id: id,
      name: name,
      sku: sku,
      category: category,
      unitType: unitType,
      package: package,
      ean: ean,
      unitContent: unitContent,
      unitMessure: unitMessure,
      packageQuantity: packageQuantity,
      price: price,
    );
  }

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sku = json['sku'];
    category = json['category'];
    unitType = json['unitType'];
    package = json['package'];
    ean = json['ean'];
    unitContent = double.tryParse(json['unitContent']?.toString() ?? '');
    unitMessure = json['unitMessure'];
    packageQuantity = int.tryParse(json['packageQuantity']?.toString() ?? '');
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sku'] = sku;
    data['category'] = category;
    data['unitType'] = unitType;
    data['package'] = package;
    data['ean'] = ean;
    data['unitContent'] = unitContent;
    data['unitMessure'] = unitMessure;
    data['packageQuantity'] = packageQuantity;
    data['price'] = price;
    return data;
  }
}

class Candidate {
  String? id;
  String? name;
  String? expirationDate;

  Candidate({this.id, this.name, this.expirationDate});

  Candidate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    expirationDate = json['expirationDate'];
  }

  entity.Candidate toEntity() {
    return entity.Candidate(
      id: id,
      name: name,
      expirationDate: expirationDate,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['expirationDate'] = expirationDate;
    return data;
  }
}
