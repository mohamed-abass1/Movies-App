import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';
import 'package:movies_app1/features/auth/register_screen/RegisterStates.dart';

import '../../../domain/use_case/RegisterUseCase.dart';
@injectable
class RegisterViewModel extends Cubit<RegisterTabStates>{
  TextEditingController NameController = TextEditingController(text: 'adsas');
  TextEditingController phoneNumController = TextEditingController(text: '+201234567899' );
  TextEditingController EmailController = TextEditingController(text: 'dsgsfakjk@gmail.com');
  TextEditingController password1Controller = TextEditingController(text: 'aasidan@A1');
  TextEditingController rePassword1Controller = TextEditingController(text: 'aasidan@A1');
  List<String> avatars=['assets/images/avatar1.png',
    'assets/images/avatar2.png',
    'assets/images/avatar3.png',
    'assets/images/avatar4.png',
    'assets/images/avatar5.png',
    'assets/images/avatar6.png',
    'assets/images/avatar7.png',
    'assets/images/avatar8.png',
    'assets/images/avatar9.png'];
  var formKey = GlobalKey<FormState>();
  String? selectedAvatar;
  RegisterUseCase registerUseCase;
  RegisterViewModel({required this.registerUseCase}) : super(RegisterInitialState());


  Future<void> register() async {
    if (formKey.currentState?.validate() == true) {
    emit(RegisterDownloadState());
    var either=await registerUseCase.invoke(email: EmailController.text,
        password: password1Controller.text,
        rePassword: rePassword1Controller.text,
        name: NameController.text,
        phone: phoneNumController.text,

    );


    either.fold((l) =>emit(RegisterTabErrorState( error: l)) ,
          (response) {
      emit(
          RegisterSuccessState(registerResponseEntity:RegisterResponseEntity()));
      },);
  }}
}