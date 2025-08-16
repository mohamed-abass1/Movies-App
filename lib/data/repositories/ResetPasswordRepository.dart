import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/Errors_File.dart';
import '../../domain/entities/LogInResponseEntity.dart';
import '../../domain/repository/data_source/LogInDataSource.dart';
import '../../domain/repository/data_source/ResetPasswordDataSource.dart';
import '../../domain/repository/repository/LogInRepository.dart';
import '../../domain/repository/repository/ResetPasswordRepository.dart';
@Injectable(as:ResetPasswordRepository )
class ResetPasswordRepositoryImpl implements ResetPasswordRepository{
  ResetPasswordDataSource logInDataSource;
  ResetPasswordRepositoryImpl ({required this.logInDataSource});

  Future<Either<Failures, LogInResponseEntity>> ResetPassword( String oldPassword, String newPassword) async {
    var either =await logInDataSource.ResetPassword(oldPassword,newPassword);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}