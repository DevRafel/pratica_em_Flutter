import 'package:astronomy_picture/core/failure.dart';
// import 'package:astronomy_picture/domain/entities/apod.dart';
import 'package:dartz/dartz.dart';

abstract class UserCase<R, P>{
  /// Default useCase
  /// R is the return of function call
  /// P is the parameter of function call
    Future<Either<Failure, R>> call(P parameter);
}

class NoParamenter{}