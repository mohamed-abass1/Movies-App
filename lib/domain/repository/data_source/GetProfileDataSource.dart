import 'package:dartz/dartz.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';


abstract class GetProfileDataSource{
  Future<Either<Failures,RegisterResponseEntity>>GetProfile();
}
