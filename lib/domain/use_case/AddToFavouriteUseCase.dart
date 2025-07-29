import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';
import 'package:movies_app1/domain/repository/repository/RegisterRepository.dart';

import '../entities/AddToFavouriteResponseEntity.dart';
import '../entities/LogInResponseEntity.dart';
import '../repository/repository/AddToFavouriteRepository.dart';
import '../repository/repository/LogInRepository.dart';
 @injectable
class AddToFavouriteUseCase{
   AddToFavouriteRepository addToFavourite;
   AddToFavouriteUseCase({required this.addToFavourite});
Future<Either<Failures,AddToFavouriteResponseEntity>>invoke(String imageURL,  String year,String movieId,int rating,String name) async {
return addToFavourite.AddToFavourite(imageURL,year, movieId, rating, name);
}}
