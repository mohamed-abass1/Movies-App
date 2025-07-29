import 'package:dartz/dartz.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';

abstract class GetMoviesDataSource{
  Future<Either<Failures,MoviesListResponseEntity>>getMoviesList();
}