import 'package:flutter/material.dart';
import 'package:riversenseweb/graphfeatures/business/logics.dart';
import 'package:riversenseweb/riversdata/models/riverdetailsentity.dart';

class TableProvider extends Logics with ChangeNotifier{
  List<RiverDetails> _riverDataList = [];
List<RiverDetails> _tabledatalist = [];
  List<RiverDetails> get tableDataList =>_tabledatalist;
  int filtertype = 1;
  DateTime date = DateTime(DateTime.now().year,DateTime.now().month,);
  int graphRiverindex = 3;
  int graphlevelindex = 3;
  int maxIndex = 0;

  void settabledata(List<RiverDetails> setTablelist){

   _riverDataList = setTablelist;
    
  notifyListeners();
  
  changeData();
 
  
  }

  void setTableRiverIndex(int graphindex){
    graphRiverindex = graphindex;
    
    notifyListeners();
    notifyListeners();
      changeData();
  }

  
void changeData(){
  Logics logic = Logics();
    List<RiverDetails> temp = _riverDataList;
  if(graphRiverindex<=2){
    temp = [_riverDataList[graphRiverindex]];
  }

  if(filtertype==0){
_tabledatalist = logic.getMonths(temp,date);
}
else{
  _tabledatalist = logic.getDays(temp, date);
  }
  maxIndex = getMaxIndex(_tabledatalist);
notifyListeners();

}


  void setTableLevelIndex(int graphindex){
    graphlevelindex = graphindex;
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



}