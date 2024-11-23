import 'package:desafio_mobile_app/app/layers/domain/usecases/employeers_usecase.dart';
import 'package:flutter/material.dart';

class RemoteProvider extends ChangeNotifier {
  final EmployeersUsecase employeersUsecase;

  RemoteProvider(this.employeersUsecase);

  Future<List?> employeers() async {
    var url = 'http://192.168.1.104:3000/employees';
    final result = await employeersUsecase([url]);

    return result.fold(
      (l) {
        return null;
      },
      (r) {
        return r;
      },
    );
  }
}
