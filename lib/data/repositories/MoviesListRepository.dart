import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';
import 'package:movies_app1/domain/repository/data_source/getMoviesDataSource.dart';
import 'package:movies_app1/domain/repository/repository/GetMoviesDataSource.dart';
@Injectable(as:GetMoviesRepository )
class MoviesListRepositoryImpl implements GetMoviesRepository{
GetMoviesDataSource getMoviesDataSource;
MoviesListRepositoryImpl ({required this.getMoviesDataSource});
Future<Either<Failures, MoviesListResponseEntity>> getMoviesList() async {
var either =await getMoviesDataSource.getMoviesList();
return either.fold((error) => Left(error), (response) => Right(response));
  }
}