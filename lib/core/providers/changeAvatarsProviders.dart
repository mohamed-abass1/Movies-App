
import 'package:flutter/cupertino.dart';

class ChangeAvatarProviders extends ChangeNotifier{
  String oldAvatar='assets/images/avatar1.png';
  void ChangeAvatar(String newAvatar){
    if (oldAvatar==newAvatar){return;}
    oldAvatar=newAvatar;
    notifyListeners();

  }


}