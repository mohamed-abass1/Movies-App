import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/MoviesDetailsResponseEntity.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';

abstract class MovieSearchStates{}
class MovieSearchInitialState extends MovieSearchStates{}
class MovieSearchDownloadState extends MovieSearchStates{}
class MovieSearchErrorState extends MovieSearchStates{
  Failures error;
  MovieSearchErrorState({required this.error});}

class MovieSearchSuccessState extends MovieSearchStates{
  MoviesListResponseEntity moviesListResponseEntity;
  MovieSearchSuccessState({required this.moviesListResponseEntity});}
