import 'package:flutter/material.dart';
import 'package:riversenseweb/graphfeatures/business/logics.dart';
import 'package:riversenseweb/riversdata/models/riverdetailsentity.dart';

class TableProvider with ChangeNotifier{
  List<RiverDetails> _riverDataList = [];
  List<RiverDetails> _graphdatalist = [];
  List<RiverDetails> get graphDataList =>_graphdatalist;
  int filtertype = 0;
  DateTime date = DateTime(DateTime.now().year);
  int graphRiverindex = 3;
  int graphlevelindex = 3;


  void settabledata(List<RiverDetails> setGraphlist){

   _riverDataList = setGraphlist;
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
_graphdatalist = logic.getMonths(temp,date);
}
else{
  _graphdatalist = logic.getDays(temp, date);
  }

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