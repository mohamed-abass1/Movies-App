import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';
import 'package:movies_app1/domain/repository/data_source/RegisterDataSource.dart';
import 'package:movies_app1/domain/repository/repository/RegisterRepository.dart';

import '../../core/errors/Errors_File.dart';
import '../../domain/entities/AddToFavouriteResponseEntity.dart';
import '../../domain/entities/LogInResponseEntity.dart';
import '../../domain/repository/data_source/AddToFavouriteSource.dart';
import '../../domain/repository/data_source/LogInDataSource.dart';
import '../../domain/repository/repository/AddToFavouriteRepository.dart';
import '../../domain/repository/repository/LogInRepository.dart';
@Injectable(as:AddToFavouriteRepository )
class AddToFavouriteRepositoryImpl implements AddToFavouriteRepository{
  AddToFavouriteDataSource logInDataSource;
  AddToFavouriteRepositoryImpl ({required this.logInDataSource});

  Future<Either<Failures, AddToFavouriteResponseEntity>> AddToFavourite(String imageURL,  String year,String movieId,int rating,String name) async {
    var either =await logInDataSource.AddToFavourite( imageURL,   year, movieId, rating, name,);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
