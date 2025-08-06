
import 'package:dartz/dartz.dart';

import '../../../core/errors/Errors_File.dart';
import '../../entities/AddToFavouriteResponseEntity.dart';

abstract class AddToFavouriteRepository{
  Future<Either<Failures,AddToFavouriteResponseEntity>>AddToFavourite( String imageURL,  String year,String movieId,int rating,String name);
}