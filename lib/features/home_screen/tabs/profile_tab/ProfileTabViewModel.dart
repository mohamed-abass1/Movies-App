import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/domain/entities/GetAllFavouriteResponseEntity.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';
import 'package:movies_app1/domain/use_case/GetFavouriteMoviesUseCase.dart';
import 'package:movies_app1/features/home_screen/tabs/profile_tab/profileTabStates.dart';

import '../../../../domain/use_case/GetProfileUseCase.dart';
@injectable

class ProfileTabViewModel extends Cubit<ProfileTabStates>{
  GetFavouriteMoviesUseCase get50MoviesUseCase;
  GetProfileUseCase getProfileUseCase;
  List<GetAllFavouriteDataEntity>? moviesFavouriteList=[];
  List<dynamic> historyList=[];
  String? name;
  num? avatar;


  ProfileTabViewModel({required this.getProfileUseCase,required this.get50MoviesUseCase}) : super(ProfileTabInitialState());


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

  Future<void> getProfile() async {
    var either=await getProfileUseCase.invoke();

    either.fold((l) =>emit(ProfileTabErrorState( error: l)) ,
          (response) {
      name=response.data?.name;
      avatar=response.data?.avaterId;
print(response.data?.avaterId);
        emit(
            GetProfileSuccessState(moviesListResponseEntity: response));
      },);
  }


  Future<void>getHiveList()async {
  var Box= await Hive.openBox('hive_movies');
    var list=await Box.get('movies');
     historyList=list;
     print('historyList${historyList.length}');
}
}