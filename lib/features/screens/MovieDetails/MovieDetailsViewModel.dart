import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/domain/entities/MoviesDetailsResponseEntity.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';
import 'package:movies_app1/domain/use_case/GetMoviesDetailsUseCase.dart';
import 'package:movies_app1/domain/use_case/GetMoviesSuggestUseCase.dart';
import 'package:movies_app1/domain/use_case/IsFavouriteMoviesUseCase.dart';
import 'package:movies_app1/domain/use_case/RemoveFavouriteMoviesUseCase.dart';
import 'package:movies_app1/features/screens/MovieDetails/MovieDetailsStates.dart';

import '../../../domain/use_case/AddToFavouriteUseCase.dart';
@injectable
class MovieDetailsViewModel extends Cubit<MovieDetailsStates>{
GetMoviesDetailsUseCase moviesDetailsUseCase;
GetMoviesSuggestUseCase moviesSuggestCase;
AddToFavouriteUseCase addMovieToFavouriteUseCase;
IsFavouriteMoviesUseCase isFavouriteMoviesUseCase;
 MoviesDetailsEntity movieDetails=MoviesDetailsEntity();
 List<MoviesEntity> moviesSuggest=[];
 RemoveFavouriteMoviesUseCase removeFavouriteMoviesUseCase;
 bool? favouriteMessage;

  MovieDetailsViewModel({required this.removeFavouriteMoviesUseCase,required this.addMovieToFavouriteUseCase,required this.moviesSuggestCase,
    required this.moviesDetailsUseCase,required this.isFavouriteMoviesUseCase}) : super(MovieDetailsInitialState());

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
        (response) {moviesSuggest=response.data?.movies??[];
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

Future<void> isFavourite(String id) async {
  var either=await isFavouriteMoviesUseCase.invoke(id);
  either.fold((l) =>emit(IsFavouriteErrorState(error: l)) ,
        (response) {
    favouriteMessage=response.data;
    print('favourite?${response.data}');
    emit(
        IsFavouriteSuccessState(moviesListResponseEntity: response));
    },);
}

Future<void> removeFavourite(String id) async {
  var either=await removeFavouriteMoviesUseCase.invoke(id);
  either.fold((l) =>emit(IsFavouriteErrorState(error: l)) ,
        (response) {
      print('remove favourite?${response.data}');
      emit(
          RemoveFavouriteSuccessState(moviesListResponseEntity: response));
    },);
}

}