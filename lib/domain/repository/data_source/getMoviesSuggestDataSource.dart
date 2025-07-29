import 'package:dartz/dartz.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/MoviesDetailsResponseEntity.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';

import '../../../data/model/MoviesListResponseDM.dart';

abstract class GetMoviesSuggestDataSource{
  Future<Either<Failures,MoviesListResponseDm>>getSuggestMoviesList(String id);
}
