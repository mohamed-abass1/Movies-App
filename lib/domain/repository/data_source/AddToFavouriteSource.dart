
import 'package:dartz/dartz.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';

import '../../entities/AddToFavouriteResponseEntity.dart';

abstract class AddToFavouriteDataSource{
  Future<Either<Failures,AddToFavouriteResponseEntity>>AddToFavourite( String imageURL,  String year,String movieId,int rating,String name);
}
