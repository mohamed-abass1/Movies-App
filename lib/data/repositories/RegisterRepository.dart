import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';
import 'package:movies_app1/domain/repository/data_source/RegisterDataSource.dart';
import 'package:movies_app1/domain/repository/repository/RegisterRepository.dart';

import '../../core/errors/Errors_File.dart';
@Injectable(as:RegisterRepository )
class RegisterRepositoryImpl implements RegisterRepository{
  RegisterDataSource registerDataSource;
  RegisterRepositoryImpl ({required this.registerDataSource});

  Future<Either<Failures, RegisterResponseEntity>> register({required String email,required String password,required String rePassword,required String name,required String phone}) async {
    var either =await registerDataSource.register(email: email, password: password, rePassword: rePassword, name:name, phone: phone);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}