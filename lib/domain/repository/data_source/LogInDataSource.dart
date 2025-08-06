import 'package:dartz/dartz.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';

import '../../entities/LogInResponseEntity.dart';

abstract class LogInDataSource{
  Future<Either<Failures,LogInResponseEntity>>LogIn({required String email, required String password});
}
