
import 'package:dartz/dartz.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';

import '../../../core/errors/Errors_File.dart';

abstract class GetProfileRepository{
  Future<Either<Failures,RegisterResponseEntity>>GetProfile();
}