import 'package:dartz/dartz.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';

abstract class UpdateProfileDataSource{
  Future<Either<Failures,RegisterResponseEntity>>UpdateProfile(email,num? avatar);
}
