import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/MoviesDetailsResponseEntity.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';
import 'package:movies_app1/domain/repository/data_source/getMoviesDataSource.dart';
import 'package:movies_app1/domain/repository/data_source/getMoviesDetailsDataSource.dart';
import 'package:movies_app1/domain/repository/repository/GetMoviesDataSource.dart';

import '../../domain/repository/data_source/getMoviesSuggestDataSource.dart';
import '../../domain/repository/repository/GetMoviesDetailsDataSource.dart';
import '../../domain/repository/repository/GetMoviesSuggestDataSource.dart';
import '../model/MoviesListResponseDM.dart';
@Injectable(as:GetMoviesSuggestRepository )
class MoviesSuggestRepositoryImpl implements GetMoviesSuggestRepository{
GetMoviesSuggestDataSource getMoviesDataSource;
MoviesSuggestRepositoryImpl ({required this.getMoviesDataSource});
Future<Either<Failures, MoviesListResponseDm>> getMoviesSuggest(String id) async {
var either =await getMoviesDataSource.getSuggestMoviesList(id);
return either.fold((error) => Left(error), (response) => Right(response));
  }
}