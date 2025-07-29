import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';
import 'package:movies_app1/domain/use_case/GetMoviesUseCase.dart';
import 'package:movies_app1/features/home_screen/tabs/home_tab/homeTabStates.dart';

import '../../../../domain/use_case/Get50MoviesUseCase.dart';
import 'BrowseTabStates.dart';
@injectable
class BrowseTabViewModel extends Cubit<BrowseTabStates>{
  Get50MoviesUseCase get50MoviesUseCase;
  List<MoviesEntity>? movies50List=[];
  String selectedTab='Action';
  int selectedIndex=0;

  List<String> tabs = ['Action',"Adventure" ,"Animation",'Romance', 'Drama', "Fantasy","Horror","Thriller","Family","Sci-Fi"];
  BrowseTabViewModel({required this.get50MoviesUseCase}) : super(BrowseTabInitialState());

  static BrowseTabViewModel get(context) => BlocProvider.of<BrowseTabViewModel>(context);

  Future<void> get50MoviesList() async {
    emit(BrowseTabDownloadState());
    var either=await get50MoviesUseCase.invoke();


    either.fold((l) =>emit(BrowseTabErrorState( error: l)) ,
          (response) {movies50List=response.data!.movies!.where((element) {return
            element.genres!.contains(tabs[selectedIndex]);
          },).toList();
    emit(
        BrowseTabSuccessState(moviesListResponseEntity: response));
    },);
  }
}