import 'package:dartz/dartz.dart';
import 'package:desafio_mobile_app/app/common/erros/models/failure_models.dart';

abstract class Usecase<Input, Output> {
  Future<Either<Failure, Output>> call(Input params);
}
