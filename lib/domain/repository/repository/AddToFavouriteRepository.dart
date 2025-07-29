
import 'package:dartz/dartz.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';

import '../../../core/errors/Errors_File.dart';
import '../../entities/AddToFavouriteResponseEntity.dart';
import '../../entities/LogInResponseEntity.dart';

abstract class AddToFavouriteRepository{
  Future<Either<Failures,AddToFavouriteResponseEntity>>AddToFavourite( String imageURL,  String year,String movieId,int rating,String name);
}