import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:desafio_mobile_app/app/common/erros/models/exeption_models.dart';
import 'package:desafio_mobile_app/app/common/erros/models/failure_models.dart';
import 'package:desafio_mobile_app/app/layers/data/datasources/remote/remote_data_datasource.dart';
import 'package:desafio_mobile_app/app/layers/domain/repositories/remote_repository.dart';

class DataRepositoryImplementation implements IDataRepository {
  final IRemoteDataDatasource remoteDataDatasource;
  final socketError = const Failure(failuretype: 'Error');

  DataRepositoryImplementation(this.remoteDataDatasource);

  @override
  Future<Either<Failure, List>> employees(List<Object> objects) async {
    try {
      final result = await remoteDataDatasource.employees(objects);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(
        failuretype: 'failuretype',
        title: e.title,
        message: e.message,
      ));
    } on SocketException {
      return Left(socketError);
    }
  }
}
