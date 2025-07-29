import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/cache/sha-pref.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';
import 'package:movies_app1/features/auth/register_screen/RegisterStates.dart';

import '../../../domain/entities/LogInResponseEntity.dart';
import '../../../domain/use_case/LogInUseCase.dart';
import '../../../domain/use_case/RegisterUseCase.dart';
import 'LogInStates.dart';
@injectable
class LogInViewModel extends Cubit<LogInTabStates>{

  TextEditingController EmailController = TextEditingController(text: 'mohamedabass1223s26@gmail.com');
  TextEditingController password1Controller = TextEditingController(text: '@mohamedABASS1');
  var formKey = GlobalKey<FormState>();
  LogInUseCase logInUseCase;
  LogInViewModel({required this.logInUseCase}) : super(LogInInitialState());


  Future<void> LogIn() async {
    if (formKey.currentState?.validate() == true) {
    emit(LogInDownloadState());
    var either=await logInUseCase.invoke(
      email: EmailController.text,
        password: password1Controller.text,

    );


    either.fold((l) =>emit(LogInTabErrorState( error: l)) ,
          (response) {
      emit(
          LogInSuccessState( logInResponseEntity: LogInResponseEntity()));
      SharedPreferenceUtils.saveData(key: 'token', value: response.data);
      print(response.data);
      },);
  }}
}