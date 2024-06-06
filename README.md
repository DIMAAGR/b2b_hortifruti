# Informações Sobre o Projeto

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

 ### Algumas considerações sobre o mobile
 
 Bom, sobre o iOS, eu não tenho mac atualmente, então é bem complicado pra mim saber se ele está funcionando no iOS, aqui até então não tive problema nenhum para rodar no android, não coloquei nenhuma variável de ambiente, flavor ou etc.

 ### ENV FILE

 Logicamente não deixarei o arquivo env dentro do .gitignore já que se faz necessário o uso dele para o funcionamento do projeto.

 ### Arquitetura

 Utilizei a arquitetura limpa do tio bob, foi bem corrido pra desenvolver mas tentei fazer o mais proximo do que foi proposto por ele, já que não tinha muito tempo pra pensar em uma arquitetura melhor.

 Se você observar, vai verificar que algumas coisas como extensions, services, alguns styles estão dentro do modulo, estão no presentation porque todos estão ali para o funcionamento correto dela, e elas não estão fora do módulo porque elas não são usadas por outros módulos, estes itens são desse modulo, feito para ele e não para outro.

 ## COMPONENTES

 ### Searcher

 Sim, o searcher funciona, talvez não da forma que eu queria, mas ele está funcionando e colocando a pesquisa em cima, no cabeçalho do navegador, queria colocar também pra continuar mostrando o que você pesquisou e quando clicar na logo ele retornar para o padrão, mas não tinha muito tempo pra isso... ;(

### Lista de Produtos

Pra não travar tanto eu fiz com que a lista só mostrasse os primeiros 16 itens e conforme vai chegando no final da lista fosse adicionando mais 16 até chegar no fim dela, também coloquei loading nela.