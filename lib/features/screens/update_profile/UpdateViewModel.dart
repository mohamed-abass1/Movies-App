import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/domain/use_case/UpdateUseCase.dart';
import 'UpdateStates.dart';

@injectable
class UpdateViewModel extends Cubit<UpdateStates> {
  UpdateProfileUseCase updateProfileUseCase;
  TextEditingController email=TextEditingController();
  num? avatar;
  String? message;
  Map<String, num> avatars = {
    'assets/images/avatar0.png': 0,
    'assets/images/avatar1.png': 1,
    'assets/images/avatar2.png': 2,
    'assets/images/avatar3.png': 3,
    'assets/images/avatar4.png': 4,
    'assets/images/avatar5.png': 5,
    'assets/images/avatar6.png': 6,
    'assets/images/avatar7.png': 7,
    'assets/images/avatar8.png': 8
  };

  UpdateViewModel({required this.updateProfileUseCase})
      : super(UpdateInitialState());

  static UpdateViewModel get(context) =>
      BlocProvider.of<UpdateViewModel>(context);

  Future<void> UpdateProfile() async {
    emit(UpdateDownloadState());
    var either = await updateProfileUseCase.invoke(email.text,avatar);
    either.fold(
      (l) => emit(UpdateErrorState(error: l)),
      (response) {
        print('avatar=$avatar');
        message = response.message;
        emit(UpdateSuccessState(moviesListResponseEntity: response));
      },
    );
  }
}
