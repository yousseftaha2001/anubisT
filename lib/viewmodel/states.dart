import 'package:flutter/material.dart';

class ManageState extends ChangeNotifier{
  bool state=false;

  void changeState(){
    state=!state;
    notifyListeners();
  }


}