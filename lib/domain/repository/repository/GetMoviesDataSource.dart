import 'package:dartz/dartz.dart';

import '../../../core/errors/Errors_File.dart';
import '../../entities/MoviesListEntity.dart';

abstract class GetMoviesRepository{
  Future<Either<Failures,MoviesListResponseEntity>>getMoviesList();
}