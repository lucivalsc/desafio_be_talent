import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String? message, title;
  final int? statusCode;

  // TODO: implement props
  const ServerException({required this.message, required this.statusCode, this.title});

  @override
  List<Object?> get props => [message, statusCode, title];
}
