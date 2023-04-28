import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCAse<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}

class NoParam {}
