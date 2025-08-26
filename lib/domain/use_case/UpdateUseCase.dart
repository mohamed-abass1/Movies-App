import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';

import '../repository/repository/UpdateProfileRepository.dart';
 @injectable
class UpdateProfileUseCase{
   UpdateProfileRepository updateProfileRepository;
   UpdateProfileUseCase({required this.updateProfileRepository});
Future<Either<Failures,RegisterResponseEntity>>invoke(email,num? avatar) async {
return updateProfileRepository.UpdateProfile( email,avatar);
}}