import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';
import 'package:movies_app1/domain/repository/data_source/getMoviesDataSource.dart';
import 'package:movies_app1/domain/repository/repository/GetMoviesDataSource.dart';

import '../../domain/repository/data_source/getMoviesSearchDataSource.dart';
import '../../domain/repository/repository/GetMoviesSerachRepository.dart';
@Injectable(as:GetMoviesSearchRepository )
class MoviesListSearchRepositoryImpl implements GetMoviesSearchRepository{
GetMoviesSearchDataSource getMoviesSearchDataSource;
MoviesListSearchRepositoryImpl ({required this.getMoviesSearchDataSource});
Future<Either<Failures, MoviesListResponseEntity>> getMoviesSearchList(String search) async {
var either =await getMoviesSearchDataSource.getMoviesSearchList(search);
return either.fold((error) => Left(error), (response) => Right(response));
  }
}