import 'package:movies_app1/domain/entities/GetAllFavouriteResponseEntity.dart';
import 'package:movies_app1/features/home_screen/tabs/profile_tab/profile_Tab.dart';

import '../../../../core/errors/Errors_File.dart';

abstract class ProfileTabStates{}
class ProfileTabInitialState extends ProfileTabStates{}
class ProfileTabDownloadState extends ProfileTabStates{}
class ProfileTabErrorState extends ProfileTabStates{
  Failures error;
  ProfileTabErrorState({required this.error});}

class ProfileTabSuccessState extends ProfileTabStates{
  GetAllFavouriteResponseEntity moviesListResponseEntity;
  ProfileTabSuccessState({required this.moviesListResponseEntity});}