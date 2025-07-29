import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';

import '../../domain/repository/data_source/get50MoviesDataSource.dart';
import '../../domain/repository/repository/Get50MoviesDataSource.dart';
@Injectable(as:Get50MoviesRepository )
class Movies50ListRepositoryImpl implements Get50MoviesRepository{
Get50MoviesDataSource get50MoviesDataSource;
Movies50ListRepositoryImpl ({required this.get50MoviesDataSource});
Future<Either<Failures, MoviesListResponseEntity>> get50MoviesList() async {
var either =await get50MoviesDataSource.get50MoviesList();
return either.fold((error) => Left(error), (response) => Right(response));
  }
}