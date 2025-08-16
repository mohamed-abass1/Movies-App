import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';

abstract class UpdateStates{}
class UpdateInitialState extends UpdateStates{}
class UpdateDownloadState extends UpdateStates{}
class UpdateChangeAvatarState extends UpdateStates{}
class UpdateErrorState extends UpdateStates{
  Failures error;
  UpdateErrorState({required this.error});}

class UpdateSuccessState extends UpdateStates{
  RegisterResponseEntity moviesListResponseEntity;
  UpdateSuccessState({required this.moviesListResponseEntity});}