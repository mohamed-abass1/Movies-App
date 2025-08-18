
import 'package:dartz/dartz.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';

import '../../../core/errors/Errors_File.dart';

abstract class UpdateProfileRepository{
  Future<Either<Failures,RegisterResponseEntity>>UpdateProfile(num? avatar);
}

