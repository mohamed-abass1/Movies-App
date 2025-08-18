import 'package:dartz/dartz.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';

import '../../entities/IsFavouriteResponseEntity.dart';

abstract class RemoveMoviesFavouriteDataSource{
  Future<Either<Failures,IsFavouriteResponseEntity>>RemoveMoviesFavouriteList(String id);
}