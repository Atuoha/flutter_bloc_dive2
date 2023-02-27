import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final String code;
  final String errMsg;
  final String plugin;

  const CustomError({
    required this.code,
    required this.errMsg,
    required this.plugin,
  });

  factory CustomError.initial() =>
      const CustomError(code: '', errMsg: '', plugin: '');

  @override
  String toString() =>
      'CustomError{code: $code, errMsg: $errMsg, plugin: $plugin}';

  @override
  List<Object?> get props => [code, errMsg, plugin];
}
