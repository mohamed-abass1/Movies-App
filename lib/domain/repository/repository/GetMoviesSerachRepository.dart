import 'package:dartz/dartz.dart';

import '../../../core/errors/Errors_File.dart';
import '../../entities/MoviesListEntity.dart';

abstract class GetMoviesSearchRepository{
  Future<Either<Failures,MoviesListResponseEntity>>getMoviesSearchList(String search);
}