import 'package:desafio_mobile_app/app/common/utils/http/http_client.dart';
import 'package:desafio_mobile_app/app/common/utils/http/http_client_implementation.dart';
import 'package:desafio_mobile_app/app/layers/data/datasources/remote/remote_data_datasource_implementation.dart';
import 'package:desafio_mobile_app/app/layers/data/repositories/remote_repository_implementation.dart';
import 'package:desafio_mobile_app/app/layers/domain/repositories/remote_repository.dart';
import 'package:desafio_mobile_app/app/layers/domain/usecases/employeers_usecase.dart';
import 'package:desafio_mobile_app/app/layers/presenter/providers/remote_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late RemoteProvider remoteProvider;
  late IDataRepository repository;
  late RemoteDataDatasourceImplementation remoteDataDatasource;
  
  setUp(() {
    IHttpClient client = HttpClientImplementation();
    remoteDataDatasource = RemoteDataDatasourceImplementation(client);
    repository = DataRepositoryImplementation(remoteDataDatasource);
    final employeersUsecase = EmployeersUsecase(repository);
    
    remoteProvider = RemoteProvider(employeersUsecase);
  });

  test('', () async {
    List? lista = await remoteProvider.employeers();
    expect(lista, isNotNull);
  });
}
