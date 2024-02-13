import 'dart:developer';

import 'package:flutter/material.dart';

class SelectionProvider with ChangeNotifier{

  int _selectRailindex = 0;
  int get railIndex=>_selectRailindex;



  void changeNavigationRailIndex(int railindex){
    log(' rail index: $railIndex');
    _selectRailindex = railindex;
    notifyListeners();
  }


}