import 'package:dartz/dartz.dart';
import 'package:desafio_mobile_app/app/common/erros/models/failure_models.dart';

abstract class IDataRepository {
  Future<Either<Failure, List>> employees(List<Object> objects);
}
