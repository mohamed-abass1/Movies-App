import 'package:dartz/dartz.dart';

import '../../../core/errors/Errors_File.dart';
import '../../../data/model/MoviesListResponseDM.dart';

abstract class GetMoviesSuggestRepository{
  Future<Either<Failures,MoviesListResponseDm>>getMoviesSuggest(String id);
}
