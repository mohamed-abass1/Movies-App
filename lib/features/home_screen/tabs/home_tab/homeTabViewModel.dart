import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as box;
import 'package:injectable/injectable.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';
import 'package:movies_app1/domain/use_case/GetMoviesUseCase.dart';
import 'package:movies_app1/features/home_screen/tabs/home_tab/homeTabStates.dart';

import '../../../../domain/use_case/Get50MoviesUseCase.dart';
@injectable
class HomeTabViewModel extends Cubit<HomeTabStates>{
  String? chosenWallpaper;
  GetMoviesUseCase getMoviesUseCase;
  Get50MoviesUseCase get50MoviesUseCase;
  List<MoviesEntity>? movies50List=[];
  List<MoviesEntity>? dramaList=[];
  List<MoviesEntity>? actionList=[];
  List<MoviesEntity>? comedyList=[];
  List<MoviesEntity>? romanceList=[];
  List<MoviesEntity>? scienceFictionList=[];
  List<MoviesEntity>? hiveList=[];

  List<MoviesEntity>? moviesList=[];
  HomeTabViewModel({required this.getMoviesUseCase,required this.get50MoviesUseCase}) : super(HomeTabInitialState());

  static HomeTabViewModel get(context) => BlocProvider.of<HomeTabViewModel>(context);
  
  Future<void> changeWallpaper(int index)async {
    emit(HomeTabChangeWallpaperState());
    chosenWallpaper=moviesList![index].largeCoverImage;}

  Future<void> getMoviesList() async {
    emit(HomeTabDownloadState());

    var either=await getMoviesUseCase.invoke();
    either.fold((l) =>emit(HomeTabErrorState( error: l)) , (response) {moviesList=response.data!.movies!;
    chosenWallpaper=moviesList!.elementAt(2).largeCoverImage;
    print(hiveList?.length);
      emit(
          HomeTabSuccessState(moviesListResponseEntity: response));
    },);
  }

  Future<void> get50MoviesList() async {
    emit(HomeTabDownloadState());
    var either=await get50MoviesUseCase.invoke();


    either.fold((l) =>emit(HomeTabErrorState( error: l)) , (response) {movies50List=response.data!.movies!;
    dramaList=movies50List!.where((element) {return
      element.genres!.contains('Drama');
    },).toList();
    actionList=movies50List!.where((element) {return
      element.genres!.contains('Action');
    },).toList();
    comedyList=movies50List!.where((element) {return
      element.genres!.contains('Comedy');
    },).toList();
    romanceList=movies50List!.where((element) {return
      element.genres!.contains('Romance');
    },).toList();
    scienceFictionList=movies50List!.where((element) {return
      element.genres!.contains('Sci-Fi');
    },).toList();
    emit(
        HomeTab50MoviesSuccessState(moviesListResponseEntity: response));
    },);
  }
  Future<void> saveHiveList(MoviesListResponseEntity movie) async {
   var box=await Hive.openBox('hive_movies');
  await box.put('movies', hiveList);
   box.close();

  }

}