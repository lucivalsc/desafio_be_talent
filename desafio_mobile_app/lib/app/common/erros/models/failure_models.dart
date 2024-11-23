import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String failuretype;
  final String? title;
  final String? message;

  const Failure({required this.failuretype, this.title, this.message});
  @override
  List<Object?> get props => [failuretype, title, message];
}
