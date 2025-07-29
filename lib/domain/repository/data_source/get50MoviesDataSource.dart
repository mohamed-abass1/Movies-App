import 'package:dartz/dartz.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';

abstract class Get50MoviesDataSource{
  Future<Either<Failures,MoviesListResponseEntity>>get50MoviesList();
}