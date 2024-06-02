**Notas:** Eu tinha ficado um pouco na duvida se usar o `ResponseData` no controlador usando ResponseData.failure(falha) ResponseData.success(data) se estaria correta, como mostra o exemplo abaixo:

```dart
  Future<void> getStoreData() async {
    final result = await _getStoreDataUseCase();

    storeData.value = result.fold(
      (failure) => ResponseData.failure(failure.message),
      (data) => ResponseData.success(data),
    );

    notifyListeners();
  }
```


 E, depois de muito pesquisar, encontrei a seguinte: Na Clean Architecture, é importante manter a separação de responsabilidades clara e a conversão do resultado do use case para um formato específico para a camada de apresentação é de responsabilidade do controlador, não das classes de use case ou repository. Então eu acredito que a abordagem esteja correta, talvez não com o melhor nome para essa classe.