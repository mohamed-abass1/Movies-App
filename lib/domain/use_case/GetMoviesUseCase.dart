import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';
import 'package:movies_app1/domain/repository/repository/GetMoviesDataSource.dart';
@injectable
class GetMoviesUseCase{
  GetMoviesRepository getMoviesRepository;
  GetMoviesUseCase({required this.getMoviesRepository});
Future<Either<Failures,MoviesListResponseEntity>>invoke(){
 return getMoviesRepository.getMoviesList();
}
}