import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/cache/sha-pref.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';
import 'package:movies_app1/features/auth/register_screen/RegisterStates.dart';

import '../../../domain/entities/LogInResponseEntity.dart';
import '../../../domain/use_case/LogInUseCase.dart';
import '../../../domain/use_case/RegisterUseCase.dart';
import '../../../domain/use_case/ResetPasswordUseCase.dart';
import 'ResetPasswordStates.dart';
@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordTabStates>{
  bool NewPasswordObscureText = true;
  bool OldPasswordObscureText = true;
  TextEditingController oldPasswordController = TextEditingController(text: '@mohamedABASS1');
  TextEditingController NewPassword1Controller = TextEditingController(text: '@mohamedABASS1');
  var formKey = GlobalKey<FormState>();
  ResetPasswordUseCase logInUseCase;
  ResetPasswordViewModel({required this.logInUseCase}) : super(ResetPasswordInitialState());


  Future<void> ResetPassword() async {
    if (formKey.currentState?.validate() == true) {
    emit(ResetPasswordDownloadState());
    var either=await logInUseCase.invoke(
      oldPassword: oldPasswordController.text,
        newPassword: NewPassword1Controller.text,

    );


    either.fold((l) =>emit(ResetPasswordTabErrorState( error: l)) ,
          (response) {
      emit(
          ResetPasswordSuccessState( resetPasswordResponseEntity: LogInResponseEntity()));
      },);
  }}

  void unObscureNewPassword() {
    NewPasswordObscureText = false;
    emit(ShowNewPassword());
  }

  void ObscureNewPassword() {
    NewPasswordObscureText = true;
    emit(UnShowNewPassword());
  }

  void unObscureOldPassword() {
    OldPasswordObscureText = false;
    emit(ShowOldPassword());
  }

  void ObscurOldPassword() {
    OldPasswordObscureText = true;
    emit(UnShowOldPassword());
  }
}

