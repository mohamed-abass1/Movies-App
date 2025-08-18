import 'package:dartz/dartz.dart';

import '../../../core/errors/Errors_File.dart';
import '../../entities/IsFavouriteResponseEntity.dart';

abstract class RemoveFavouriteMoviesRepository{
  Future<Either<Failures,IsFavouriteResponseEntity>>RemoveFavouriteMoviesList(String id);
}