import 'package:dartz/dartz.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/MoviesDetailsResponseEntity.dart';

abstract class GetMoviesDetailsDataSource{
  Future<Either<Failures,MoviesDetailsResponseEntity>>getDetailsMoviesList(String id);
}