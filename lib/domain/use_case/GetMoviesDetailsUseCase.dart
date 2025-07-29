import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/MoviesDetailsResponseEntity.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';
import 'package:movies_app1/domain/repository/repository/GetMoviesDataSource.dart';

import '../repository/repository/GetMoviesDetailsDataSource.dart';
@injectable
class GetMoviesDetailsUseCase{
  GetMoviesDetailsRepository getMoviesRepository;
  GetMoviesDetailsUseCase({required this.getMoviesRepository});
Future<Either<Failures, MoviesDetailsResponseEntity>>invoke(String id){
 return getMoviesRepository.getMoviesDetails(id);
}
}