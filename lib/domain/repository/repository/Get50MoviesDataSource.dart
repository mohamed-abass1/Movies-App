import 'package:dartz/dartz.dart';

import '../../../core/errors/Errors_File.dart';
import '../../entities/MoviesListEntity.dart';

abstract class Get50MoviesRepository{
  Future<Either<Failures,MoviesListResponseEntity>>get50MoviesList();
}