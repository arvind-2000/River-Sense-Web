import 'dart:math';

import 'package:flutter/material.dart';
import 'package:riversenseweb/graphfeatures/business/logics.dart';
import 'package:riversenseweb/riversdata/models/riverdetailsentity.dart';

class GraphProvider with ChangeNotifier{
  List<RiverDetails> _riverDataList = [];
  List<RiverDetails> _graphdatalist = [];
  List<RiverDetails> get graphDataList =>_graphdatalist;
  int filtertype = 0;
  DateTime date = DateTime(DateTime.now().year,DateTime.now().month,);
  int graphRiverindex = 3;
  int graphlevelindex = 0;
  bool islinegraph = true;
  int maxindex = 0;

  void setgraphdata(List<RiverDetails> setGraphlist){

   _riverDataList = setGraphlist;
    notifyListeners();
  changeData();
 
  
  }

  void setGraphRiverIndex(int graphindex){
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
_graphdatalist = logic.getMonths(temp,date)..reversed;
}
else{
  _graphdatalist = logic.getDays(temp, date)..reversed;
  }
notifyListeners();

changeMaxIndex();
}


  void setGraphLevelIndex(int graphindex){
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

void changeGraphStyle(){
  islinegraph = !islinegraph;
  notifyListeners();
}

void changeMaxIndex(){
if(_graphdatalist.length>1){
for(int i = 0;i<_graphdatalist.length-1;i++){
  if(_graphdatalist[i].river.length<_graphdatalist[i+1].river.length){
    maxindex = i+1;
  }else{
    maxindex = i;
  }
}
}

notifyListeners();
}

}