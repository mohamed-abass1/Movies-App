import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/MoviesDetailsResponseEntity.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';
import 'package:movies_app1/domain/repository/repository/GetMoviesDataSource.dart';

import '../../data/model/MoviesListResponseDM.dart';
import '../repository/repository/GetMoviesDetailsDataSource.dart';
import '../repository/repository/GetMoviesSuggestDataSource.dart';
@injectable
class GetMoviesSuggestUseCase{
  GetMoviesSuggestRepository getMoviesRepository;
  GetMoviesSuggestUseCase({required this.getMoviesRepository});
Future<Either<Failures, MoviesListResponseEntity>>invoke(String id){
 return getMoviesRepository.getMoviesSuggest(id);
}
}