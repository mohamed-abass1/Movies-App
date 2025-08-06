
import 'package:flutter/cupertino.dart';

class ChangeAvatarProviders extends ChangeNotifier{
  String oldAvatar='assets/images/avatar1.png';
  num avatar=1;
  void ChangeAvatar(String newAvatar){
    if (oldAvatar==newAvatar){return;}
    oldAvatar=newAvatar;
    notifyListeners();

  }
  void ChangeAvatarNum(num newAvatar){
    if (oldAvatar==newAvatar){return;}
    avatar=newAvatar;
    notifyListeners();

  }


}