import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
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
import '../../../../domain/use_case/GetMoviesSearchUseCase.dart';
import 'MovieSearchStates.dart';
@injectable
class MovieSearchViewModel extends Cubit<MovieSearchStates>{
GetMoviesSearchUseCase moviesSearchUseCase;
 List<MoviesEntity> moviesSearch=[];
TextEditingController Search=TextEditingController();
MovieSearchViewModel({required this.moviesSearchUseCase}) : super(MovieSearchInitialState());

  Future<void> getMovieSearch() async {
    emit(MovieSearchDownloadState());
    var either=await moviesSearchUseCase.invoke(Search.text);
    either.fold((l) =>emit(MovieSearchErrorState( error: l)) ,
          (response) {moviesSearch=response.data!.movies??[];
      print(moviesSearch.length);
      print(Search.text);
      emit(
          MovieSearchSuccessState(moviesListResponseEntity: response));
    },);
  }

}