import 'package:dartz/dartz.dart';
import 'package:desafio_mobile_app/app/common/erros/models/failure_models.dart';
import 'package:desafio_mobile_app/app/common/usecase.dart';
import 'package:desafio_mobile_app/app/layers/domain/repositories/remote_repository.dart';

class EmployeersUsecase implements Usecase<List<Object>, List> {
  final IDataRepository repository;

  const EmployeersUsecase(this.repository);

  @override
  Future<Either<Failure, List>> call(List<Object> object) async {
    return await repository.employees(object);
  }
}
