import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';

import '../entities/LogInResponseEntity.dart';
import '../repository/repository/ResetPasswordRepository.dart';
 @injectable
class ResetPasswordUseCase{
   ResetPasswordRepository logInRepository;
   ResetPasswordUseCase({required this.logInRepository});
Future<Either<Failures,LogInResponseEntity>>invoke({required String newPassword,required String oldPassword}) async {
return logInRepository.ResetPassword( oldPassword,newPassword );
}}