import 'package:dartz/dartz.dart';
import 'package:movies_app1/domain/entities/MoviesDetailsResponseEntity.dart';

import '../../../core/errors/Errors_File.dart';
import '../../../data/model/MoviesListResponseDM.dart';
import '../../entities/MoviesListEntity.dart';

abstract class GetMoviesSuggestRepository{
  Future<Either<Failures,MoviesListResponseDm>>getMoviesSuggest(String id);
}
