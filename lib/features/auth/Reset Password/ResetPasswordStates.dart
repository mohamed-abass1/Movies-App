import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';

import '../../../domain/entities/LogInResponseEntity.dart';
import '../../../domain/entities/RegisterResponseEntity.dart';

abstract class ResetPasswordTabStates{}
class ResetPasswordInitialState extends ResetPasswordTabStates{}
class ResetPasswordDownloadState extends ResetPasswordTabStates{}
class ResetPasswordTabErrorState extends ResetPasswordTabStates{
  Failures error;
  ResetPasswordTabErrorState({required this.error});}

class ResetPasswordSuccessState extends ResetPasswordTabStates{
  LogInResponseEntity resetPasswordResponseEntity;
  ResetPasswordSuccessState({required this.resetPasswordResponseEntity});}
class ShowOldPassword extends ResetPasswordTabStates{}
class UnShowOldPassword extends ResetPasswordTabStates{}
class ShowNewPassword extends ResetPasswordTabStates{}
class UnShowNewPassword extends ResetPasswordTabStates{}