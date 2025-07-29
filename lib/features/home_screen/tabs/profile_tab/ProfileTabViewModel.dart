import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/domain/entities/GetAllFavouriteResponseEntity.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';
import 'package:movies_app1/domain/use_case/GetFavouriteMoviesUseCase.dart';
import 'package:movies_app1/domain/use_case/GetMoviesUseCase.dart';
import 'package:movies_app1/features/home_screen/tabs/home_tab/homeTabStates.dart';
import 'package:movies_app1/features/home_screen/tabs/profile_tab/profileTabStates.dart';

import '../../../../domain/use_case/Get50MoviesUseCase.dart';
@injectable

class ProfileTabViewModel extends Cubit<ProfileTabStates>{
  GetFavouriteMoviesUseCase get50MoviesUseCase;
  List<GetAllFavouriteDataEntity>? moviesFavouriteList=[];

  ProfileTabViewModel({required this.get50MoviesUseCase}) : super(ProfileTabInitialState());


  Future<void> getFavouriteMoviesList() async {
    emit(ProfileTabDownloadState());
    var either=await get50MoviesUseCase.invoke();

    either.fold((l) =>emit(ProfileTabErrorState( error: l)) ,
          (response) {
            print(moviesFavouriteList?.length);
            moviesFavouriteList=response.data;
            print(moviesFavouriteList?.length);
    emit(
        ProfileTabSuccessState(moviesListResponseEntity: response));
    },);
  }
}