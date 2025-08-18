import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';

import '../entities/IsFavouriteResponseEntity.dart';
import '../repository/repository/IstFavouriteMoviesDataSource.dart';
@injectable
class IsFavouriteMoviesUseCase{
  IsFavouriteMoviesRepository isFavouriteMoviesRepository;
  IsFavouriteMoviesUseCase({required this.isFavouriteMoviesRepository});
Future<Either<Failures, IsFavouriteResponseEntity>>invoke(String id){
 return isFavouriteMoviesRepository.IsFavouriteMoviesList(id);
}
}