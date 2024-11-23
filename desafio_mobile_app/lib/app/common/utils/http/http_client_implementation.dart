import 'package:desafio_mobile_app/app/common/erros/models/exeption_models.dart';
import 'package:http/http.dart' as http;
import 'package:desafio_mobile_app/app/common/utils/http/http_client.dart';

class HttpClientImplementation implements IHttpClient {
  late http.Response response;

  @override
  Future<HttpResponse> get({required String url, Map<String, String>? headers}) async {
    try {
      response = await http.get(Uri.parse(url), headers: headers).timeout(
            const Duration(seconds: 60),
          );

      return HttpResponse(
        statusCode: response.statusCode,
        data: response.body,
      );
    } catch (e) {
      throw ServerException(
        message: "Erro na requisição",
        statusCode: response.statusCode,
      );
    }
  }
}
