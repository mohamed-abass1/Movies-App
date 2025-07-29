import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/AddToFavouriteResponseEntity.dart';
import 'package:movies_app1/domain/entities/MoviesDetailsResponseEntity.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';

abstract class MovieDetailsStates{}
class MovieDetailsInitialState extends MovieDetailsStates{}
class MovieDetailsDownloadState extends MovieDetailsStates{}
class MovieDetailsErrorState extends MovieDetailsStates{
  Failures error;
  MovieDetailsErrorState({required this.error});}

class MovieDetailsSuccessState extends MovieDetailsStates{
  MoviesDetailsResponseEntity moviesListResponseEntity;
  MovieDetailsSuccessState({required this.moviesListResponseEntity});}

class MovieSuggestSuccessState extends MovieDetailsStates{
  MoviesListResponseEntity moviesListResponseEntity;
  MovieSuggestSuccessState({required this.moviesListResponseEntity});}
class AddToFavoriteErrorState extends MovieDetailsStates{
  Failures error;
  AddToFavoriteErrorState({required this.error});}

class AddToFavoriteSuccessState extends MovieDetailsStates{
  AddToFavouriteResponseEntity addToFavoriteResponseEntity;
  AddToFavoriteSuccessState({required this.addToFavoriteResponseEntity});}
