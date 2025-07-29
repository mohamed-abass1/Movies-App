import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/MoviesDetailsResponseEntity.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';
import 'package:movies_app1/domain/repository/data_source/getMoviesDataSource.dart';
import 'package:movies_app1/domain/repository/data_source/getMoviesDetailsDataSource.dart';
import 'package:movies_app1/domain/repository/repository/GetMoviesDataSource.dart';

import '../../domain/repository/repository/GetMoviesDetailsDataSource.dart';
@Injectable(as:GetMoviesDetailsRepository )
class MoviesDetailsRepositoryImpl implements GetMoviesDetailsRepository{
GetMoviesDetailsDataSource getMoviesDataSource;
MoviesDetailsRepositoryImpl ({required this.getMoviesDataSource});
Future<Either<Failures, MoviesDetailsResponseEntity>> getMoviesDetails(String id) async {
var either =await getMoviesDataSource.getDetailsMoviesList(id);
return either.fold((error) => Left(error), (response) => Right(response));
  }
}