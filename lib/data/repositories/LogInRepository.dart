import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/Errors_File.dart';
import '../../domain/entities/LogInResponseEntity.dart';
import '../../domain/repository/data_source/LogInDataSource.dart';
import '../../domain/repository/repository/LogInRepository.dart';
@Injectable(as:LogInRepository )
class LogInRepositoryImpl implements LogInRepository{
  LogInDataSource logInDataSource;
  LogInRepositoryImpl ({required this.logInDataSource});

  Future<Either<Failures, LogInResponseEntity>> LogIn({required String email,required String password}) async {
    var either =await logInDataSource.LogIn(email: email, password: password,);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}