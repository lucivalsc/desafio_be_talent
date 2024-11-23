import 'dart:convert';

import 'package:desafio_mobile_app/app/common/erros/models/exeption_models.dart';
import 'package:desafio_mobile_app/app/common/utils/http/http_client.dart';
import 'package:desafio_mobile_app/app/layers/data/datasources/remote/remote_data_datasource.dart';

class RemoteDataDatasourceImplementation implements IRemoteDataDatasource {
  final Map<String, String> headers = {"Content-Type": "application/json; charset=utf-8"};

  final IHttpClient client;

  RemoteDataDatasourceImplementation(this.client);

  @override
  Future<List> employees(List<Object> objects) async {
    final url = objects[0] as String;
    try {
      final response = await client.get(url: url, headers: Map.from(headers));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(utf8.decode(response.data.codeUnits));
      }
    } catch (e) {
      throw const ServerException(message: "", statusCode: 1);
    }
    return [];
  }
}
