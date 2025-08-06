import 'package:dartz/dartz.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';

abstract class RegisterDataSource{
  Future<Either<Failures,RegisterResponseEntity>>register({required num avatar,required String email, required String password,required String rePassword,required String name,required String phone});
}