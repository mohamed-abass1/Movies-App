
import 'package:dartz/dartz.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';

import '../../../core/errors/Errors_File.dart';
import '../../entities/LogInResponseEntity.dart';

abstract class LogInRepository{
  Future<Either<Failures,LogInResponseEntity>>LogIn({required String email,required String password,});
}