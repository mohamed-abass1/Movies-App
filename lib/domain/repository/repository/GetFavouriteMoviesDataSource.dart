import 'package:dartz/dartz.dart';
import 'package:movies_app1/domain/entities/GetAllFavouriteResponseEntity.dart';

import '../../../core/errors/Errors_File.dart';

abstract class GetFavouriteMoviesRepository{
  Future<Either<Failures,GetAllFavouriteResponseEntity>>getFavouriteMoviesList();
}