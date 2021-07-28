import 'package:flutter/material.dart';

class ManageState extends ChangeNotifier{
  bool state=true;

  void changeState(){
    state=!state;
    notifyListeners();
  }


}