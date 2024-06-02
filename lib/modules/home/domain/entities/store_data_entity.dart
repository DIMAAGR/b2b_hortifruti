// Não sou fã de usar equatable dentro do domain já que ele não deveria usar pacotes
// externos, então, como esse é um projeto mais simples não estarei usando

class StoreDataEntity {
  final String storeName;
  final String cnpj;

  StoreDataEntity({required this.cnpj, required this.storeName});
}
