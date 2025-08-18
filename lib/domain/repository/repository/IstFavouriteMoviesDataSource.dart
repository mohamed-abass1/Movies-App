import 'package:dartz/dartz.dart';

import '../../../core/errors/Errors_File.dart';
import '../../entities/IsFavouriteResponseEntity.dart';

abstract class IsFavouriteMoviesRepository{
  Future<Either<Failures,IsFavouriteResponseEntity>>IsFavouriteMoviesList(String id);
}