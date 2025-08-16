import 'package:dartz/dartz.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/LogInResponseEntity.dart';

abstract class ResetPasswordDataSource{
  Future<Either<Failures,LogInResponseEntity>>ResetPassword(String oldPassword,String newPassword);
}