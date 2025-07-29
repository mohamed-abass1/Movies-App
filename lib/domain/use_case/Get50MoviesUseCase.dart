import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';
import 'package:movies_app1/domain/repository/repository/GetMoviesDataSource.dart';

import '../repository/repository/Get50MoviesDataSource.dart';
@injectable
class Get50MoviesUseCase{
  Get50MoviesRepository get50MoviesRepository;
  Get50MoviesUseCase({required this.get50MoviesRepository});
Future<Either<Failures,MoviesListResponseEntity>>invoke(){
 return get50MoviesRepository.get50MoviesList();
}
}