import 'package:b2b_hortifruti/core/const/constants.dart';
import 'package:b2b_hortifruti/core/remote_data/exceptions/forbidden_exception.dart';
import 'package:dio/dio.dart';

class RemoteAPI {
  Dio _dio = Dio();

  RemoteAPI() {
    _dio.options = BaseOptions(
      baseUrl: Const.baseURL,
      headers: {'token': Const.apikey},
    );
  }

  Future<Map<String, dynamic>> get(
    String path,
  ) async {
    try {
      final result = await _dio.get(path);
      switch (result.statusCode) {
        case 403:
          throw ForbiddenException(message: 'Ops! Você não tem acesso a esse conteúdo!');
        default:
          return result.data;
      }
    } catch (e) {
      throw e;
    }
  }
}
