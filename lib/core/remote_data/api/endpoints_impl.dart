import 'package:b2b_hortifruti/core/remote_data/api/endpoints.dart';
import 'package:b2b_hortifruti/core/remote_data/api/remote_api.dart';

class EndpointsImpl extends Endpoints {
  RemoteAPI _remoteAPI;

  EndpointsImpl(this._remoteAPI);

  @override
  Future<Map<String, dynamic>> searchProducts([Map<String, dynamic>? params]) async {
    try {
      String arguments = params?['arguments'] ?? '*';
      String path = '/process/candidates/search-products?argument=';

      final result = await _remoteAPI.get(path + arguments);
      return result;
    } catch (e) {
      throw e;
    }
  }
}
