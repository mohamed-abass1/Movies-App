import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/domain/entities/MoviesDetailsResponseEntity.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';
import 'package:movies_app1/domain/use_case/GetMoviesDetailsUseCase.dart';
import 'package:movies_app1/domain/use_case/GetMoviesSuggestUseCase.dart';
import 'package:movies_app1/domain/use_case/GetMoviesUseCase.dart';
import 'package:movies_app1/features/home_screen/tabs/home_tab/homeTabStates.dart';
import 'package:movies_app1/features/screens/MovieDetails/MovieDetailsStates.dart';

import '../../../../domain/use_case/Get50MoviesUseCase.dart';
import '../../../domain/use_case/AddToFavouriteUseCase.dart';
@injectable
class MovieDetailsViewModel extends Cubit<MovieDetailsStates>{
GetMoviesDetailsUseCase moviesDetailsUseCase;
GetMoviesSuggestUseCase moviesSuggestCase;
AddToFavouriteUseCase addMovieToFavouriteUseCase;

 MoviesDetailsEntity movieDetails=MoviesDetailsEntity();
 List<MoviesEntity> moviesSuggest=[];

  MovieDetailsViewModel({required this.addMovieToFavouriteUseCase,required this.moviesSuggestCase,
    required this.moviesDetailsUseCase}) : super(MovieDetailsInitialState());

  Future<void> getMovieDetails(String id) async {
    emit(MovieDetailsDownloadState());
    var either=await moviesDetailsUseCase.invoke(id);
    either.fold((l) =>emit(MovieDetailsErrorState( error: l)) ,
          (response) {movieDetails=response.data!.movie!;
      emit(
          MovieDetailsSuccessState(moviesListResponseEntity: response));
    },);
  }

Future<void> getMovieSuggest(String id) async {
  var either=await moviesSuggestCase.invoke(id);
  either.fold((l) =>emit(MovieDetailsErrorState( error: l)) ,
        (response) {moviesSuggest=response.data!.movies!;
    emit(
        MovieSuggestSuccessState(moviesListResponseEntity: response));
    },);
}
Future<void>addMovieToFavourite(String imageURL,  String year,String movieId,int rating,String name) async {
  var either=await addMovieToFavouriteUseCase.invoke(imageURL,year,movieId,rating,name);
  either.fold((l) =>emit(AddToFavoriteErrorState( error: l)) ,
        (response) {
    emit(
        AddToFavoriteSuccessState(addToFavoriteResponseEntity: response));
    },);
}
}