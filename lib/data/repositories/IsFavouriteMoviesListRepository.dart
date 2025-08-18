import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';


import '../../domain/entities/IsFavouriteResponseEntity.dart';
import '../../domain/repository/data_source/IsMoviesFavouriteDataSource.dart';

import '../../domain/repository/repository/IstFavouriteMoviesDataSource.dart';
@Injectable(as:IsFavouriteMoviesRepository )
class IsMoviesFavouriteListRepositoryImpl implements IsFavouriteMoviesRepository{
  IsMoviesFavouriteDataSource getMoviesDataSource;
  IsMoviesFavouriteListRepositoryImpl ({required this.getMoviesDataSource});
Future<Either<Failures, IsFavouriteResponseEntity>> IsFavouriteMoviesList(String id) async {
var either =await getMoviesDataSource.IsMoviesFavouriteList(id);
return either.fold((error) => Left(error), (response) => Right(response));
  }
}