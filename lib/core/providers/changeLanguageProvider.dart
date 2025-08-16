import 'package:flutter/cupertino.dart';

class ChangeLanguageProviders extends ChangeNotifier{
String LanguageApp='en';
  void ChangeLanguage(String newLanguage){
    if (LanguageApp==newLanguage){return;}
    LanguageApp=newLanguage;
    notifyListeners();
  }
}