class MarketDataEntity {
  List<Sections>? sections;
  Candidate? candidate;

  MarketDataEntity({this.sections, this.candidate});

  get isSectionsEmpty {
    if (sections == null) return true;

    for (Sections section in sections!) {
      if (section.isProductsNotEmpty) {
        return false;
      }
    }
    return true;
  }
}

class Sections {
  String? section;
  String? description;
  List<Products>? products;

  Sections({this.section, this.description, this.products});

  bool get isProductsNotEmpty => products?.isNotEmpty ?? false;
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
}

class Candidate {
  String? id;
  String? name;
  String? expirationDate;

  Candidate({this.id, this.name, this.expirationDate});
}
