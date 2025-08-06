import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';
import '../../../../domain/use_case/GetMoviesSearchUseCase.dart';
import 'MovieSearchStates.dart';
@injectable
class MovieSearchViewModel extends Cubit<MovieSearchStates>{
GetMoviesSearchUseCase moviesSearchUseCase;
 List<MoviesEntity> moviesSearch=[];
TextEditingController Search=TextEditingController();
MovieSearchViewModel({required this.moviesSearchUseCase}) : super(MovieSearchInitialState());
static MovieSearchViewModel get(context) => BlocProvider.of<MovieSearchViewModel>(context);

  Future<void> getMovieSearch(search) async {
    emit(MovieSearchDownloadState());
    var either=await moviesSearchUseCase.invoke(search);
    either.fold((l) =>emit(MovieSearchErrorState( error: l)) ,
          (response) {moviesSearch=response.data!.movies??[];
      print(moviesSearch.length);
      print(Search.text);
      emit(
          MovieSearchSuccessState(moviesListResponseEntity: response));
    },);
  }
}