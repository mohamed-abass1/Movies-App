import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';

abstract class BrowseTabStates{}
class BrowseTabInitialState extends BrowseTabStates{}
class BrowseTabDownloadState extends BrowseTabStates{}
class BrowseTabChangeWallpaperState extends BrowseTabStates{}
class BrowseTabErrorState extends BrowseTabStates{
  Failures error;
  BrowseTabErrorState({required this.error});}

class BrowseTabSuccessState extends BrowseTabStates{
  MoviesListResponseEntity moviesListResponseEntity;
  BrowseTabSuccessState({required this.moviesListResponseEntity});}