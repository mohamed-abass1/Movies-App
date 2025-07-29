import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';

abstract class HomeTabStates{}
class HomeTabInitialState extends HomeTabStates{}
class HomeTabDownloadState extends HomeTabStates{}
class HomeTabChangeWallpaperState extends HomeTabStates{}

class HomeTabSuccessState extends HomeTabStates{
  MoviesListResponseEntity moviesListResponseEntity;
HomeTabSuccessState({required this.moviesListResponseEntity});}

class HomeTabErrorState extends HomeTabStates{
Failures error;
HomeTabErrorState({required this.error});}
class HomeTab50MoviesSuccessState extends HomeTabStates{
  MoviesListResponseEntity moviesListResponseEntity;
  HomeTab50MoviesSuccessState({required this.moviesListResponseEntity});}
