import 'dart:math';

import 'package:flutter/material.dart';
import 'package:riversenseweb/graphfeatures/business/logics.dart';
import 'package:riversenseweb/riversdata/models/riverdetailsentity.dart';

class BarchartProvider extends Logics with ChangeNotifier{
  List<RiverDetails> _riverDataList = [];
  List<RiverDetails> _barchartdatalist = [];
  List<RiverDetails> get barchartDataList =>_barchartdatalist;
  int filtertype = 0;
  DateTime date = DateTime(DateTime.now().year,DateTime.now().month,);
  int barchartRiverindex = 3;
  int barchartlevelindex = 0;
  bool islinebarchart = true;

  void setbarchartdata(List<RiverDetails> setbarchartlist){

   _riverDataList = setbarchartlist;
    notifyListeners();
  changeData();
 
  
  }

  void setbarchartRiverIndex(int barchartindex){
    barchartRiverindex = barchartindex;
    
    notifyListeners();
    notifyListeners();
      changeData();
  }

  
void changeData(){
  Logics logic = Logics();
    List<RiverDetails> temp = _riverDataList;
  if(barchartRiverindex<=2){
    temp = [_riverDataList[barchartRiverindex]];
  }

  if(filtertype==0){
_barchartdatalist = logic.getMonths(temp,date)..reversed;
}
else{
  _barchartdatalist = logic.getDays(temp, date)..reversed;
  }
notifyListeners();
}


  void setbarchartLevelIndex(int barchartindex){
    barchartlevelindex = barchartindex;
    notifyListeners();
      changeData();
  }



  void setFiltertype(int filter){
        filtertype = filter;
  
    notifyListeners();
     changeData();
  }

void setDate(DateTime date){
  this.date = date;

  notifyListeners();
    changeData();
}

void changebarchartStyle(){
  islinebarchart = !islinebarchart;
  notifyListeners();
}

}