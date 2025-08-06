import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';

import '../../../domain/entities/RegisterResponseEntity.dart';

abstract class RegisterTabStates{}
class RegisterInitialState extends RegisterTabStates{}
class RegisterDownloadState extends RegisterTabStates{}
class RegisterTabErrorState extends RegisterTabStates{
  Failures error;
  RegisterTabErrorState({required this.error});}
class RegisterSuccessState extends RegisterTabStates{
  RegisterResponseEntity registerResponseEntity;
  RegisterSuccessState({required this.registerResponseEntity});}
class ShowPassword extends RegisterTabStates{}
class UnShowPassword extends RegisterTabStates{}
class ShowRePassword extends RegisterTabStates{}
class UnShowRePassword extends RegisterTabStates{}