import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';

import '../../../domain/entities/LogInResponseEntity.dart';
import '../../../domain/entities/RegisterResponseEntity.dart';

abstract class LogInTabStates{}
class LogInInitialState extends LogInTabStates{}
class LogInDownloadState extends LogInTabStates{}
class LogInTabErrorState extends LogInTabStates{
  Failures error;
  LogInTabErrorState({required this.error});}

class LogInSuccessState extends LogInTabStates{
  LogInResponseEntity logInResponseEntity;
  LogInSuccessState({required this.logInResponseEntity});}
class changeLanguageSuccessState extends LogInTabStates{
}
class ShowPasswordLogIn extends LogInTabStates{}
class UnShowPasswordLogIn extends LogInTabStates{}


