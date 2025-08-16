
import 'package:dartz/dartz.dart';

import '../../../core/errors/Errors_File.dart';
import '../../entities/LogInResponseEntity.dart';

abstract class ResetPasswordRepository{
  Future<Either<Failures,LogInResponseEntity>>ResetPassword(String oldPassword,String newPassword);
}