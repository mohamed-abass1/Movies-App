import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/GetAllFavouriteResponseEntity.dart';
import '../../domain/repository/data_source/getMoviesFavouriteDataSource.dart';
import '../../domain/repository/repository/GetFavouriteMoviesDataSource.dart';

@Injectable(as: GetFavouriteMoviesRepository)
class MoviesFavouriteListRepositoryImpl
    implements GetFavouriteMoviesRepository {
  GetMoviesFavouriteDataSource getMoviesDataSource;

  MoviesFavouriteListRepositoryImpl({required this.getMoviesDataSource});

  Future<Either<Failures, GetAllFavouriteResponseEntity>>
      getFavouriteMoviesList() async {
    var either = await getMoviesDataSource.getMoviesFavouriteList();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
