import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';

import '../../domain/repository/data_source/getMoviesSuggestDataSource.dart';
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