import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/GetAllFavouriteResponseEntity.dart';
import 'package:movies_app1/domain/entities/LogInResponseEntity.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';

import '../../domain/entities/IsFavouriteResponseEntity.dart';
import '../../domain/repository/data_source/IsMoviesFavouriteDataSource.dart';
import '../../domain/repository/data_source/RemoveMoviesFavouriteDataSource.dart';
import '../../domain/repository/data_source/get50MoviesDataSource.dart';
import '../../domain/repository/data_source/getMoviesFavouriteDataSource.dart';
import '../../domain/repository/repository/Get50MoviesDataSource.dart';
import '../../domain/repository/repository/GetFavouriteMoviesDataSource.dart';
import '../../domain/repository/repository/IstFavouriteMoviesDataSource.dart';
import '../../domain/repository/repository/RemoveFavouriteMoviesDataSource.dart';
@Injectable(as:RemoveFavouriteMoviesRepository )
class RemoveMoviesFavouriteListRepositoryImpl implements RemoveFavouriteMoviesRepository{
  RemoveMoviesFavouriteDataSource getMoviesDataSource;
  RemoveMoviesFavouriteListRepositoryImpl ({required this.getMoviesDataSource});
Future<Either<Failures, IsFavouriteResponseEntity>> RemoveFavouriteMoviesList(String id) async {
var either =await getMoviesDataSource.RemoveMoviesFavouriteList(id);
return either.fold((error) => Left(error), (response) => Right(response));
  }
}