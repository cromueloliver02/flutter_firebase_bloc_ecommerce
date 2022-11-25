import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final String code;
  final String message;

  const CustomError({
    this.code = '',
    this.message = '',
  });

  @override
  List<Object> get props => [code, message];

  @override
  String toString() => 'CustomError(code: $code, message: $message)';
}
