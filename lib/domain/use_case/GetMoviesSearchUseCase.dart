import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';

import '../repository/repository/GetMoviesSerachRepository.dart';
@injectable
class GetMoviesSearchUseCase{
  GetMoviesSearchRepository getMoviesSearchRepository;
  GetMoviesSearchUseCase({required this.getMoviesSearchRepository});
Future<Either<Failures,MoviesListResponseEntity>>invoke(String search){
 return getMoviesSearchRepository.getMoviesSearchList(search);
}
}