
import 'package:dartz/dartz.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';

import '../../../core/errors/Errors_File.dart';

abstract class RegisterRepository{
  Future<Either<Failures,RegisterResponseEntity>>register({required num avatar,required String email,required String password,required String rePassword,required String name,required String phone});
}