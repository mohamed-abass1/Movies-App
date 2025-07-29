import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';
import 'package:movies_app1/domain/repository/repository/RegisterRepository.dart';

import '../entities/LogInResponseEntity.dart';
import '../repository/repository/LogInRepository.dart';
 @injectable
class LogInUseCase{
   LogInRepository logInRepository;
   LogInUseCase({required this.logInRepository});
Future<Either<Failures,LogInResponseEntity>>invoke({required String email,required String password}) async {
return logInRepository.LogIn(email: email, password: password);
}}