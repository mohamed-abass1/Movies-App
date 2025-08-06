import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';

import '../repository/repository/GetMoviesSuggestDataSource.dart';
@injectable
class GetMoviesSuggestUseCase{
  GetMoviesSuggestRepository getMoviesRepository;
  GetMoviesSuggestUseCase({required this.getMoviesRepository});
Future<Either<Failures, MoviesListResponseEntity>>invoke(String id){
 return getMoviesRepository.getMoviesSuggest(id);
}
}