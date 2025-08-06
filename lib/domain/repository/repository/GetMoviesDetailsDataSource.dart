import 'package:dartz/dartz.dart';
import 'package:movies_app1/domain/entities/MoviesDetailsResponseEntity.dart';

import '../../../core/errors/Errors_File.dart';

abstract class GetMoviesDetailsRepository{
  Future<Either<Failures,MoviesDetailsResponseEntity>>getMoviesDetails(String id);
}