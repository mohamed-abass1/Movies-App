import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/GetAllFavouriteResponseEntity.dart';

import '../repository/repository/GetFavouriteMoviesDataSource.dart';
@injectable
class GetFavouriteMoviesUseCase{
  GetFavouriteMoviesRepository getFavouriteMoviesRepository;
  GetFavouriteMoviesUseCase({required this.getFavouriteMoviesRepository});
Future<Either<Failures, GetAllFavouriteResponseEntity>>invoke(){
 return getFavouriteMoviesRepository.getFavouriteMoviesList();
}
}