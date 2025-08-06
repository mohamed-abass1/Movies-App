import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';
import 'package:movies_app1/domain/repository/repository/RegisterRepository.dart';
 @injectable
class RegisterUseCase{
   RegisterRepository registerRepository;
   RegisterUseCase({required this.registerRepository});
Future<Either<Failures,RegisterResponseEntity>>invoke({required num avatar,required String email,required String password,required String rePassword,required String name,required String phone}) async {
return registerRepository.register(email: email, password: password, rePassword: rePassword, name: name, phone: phone, avatar: avatar);
}}