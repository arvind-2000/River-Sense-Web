import 'package:flutter/material.dart';
import 'package:riversenseweb/riversdata/models/riverdetailsentity.dart';

class GraphProvider with ChangeNotifier{

  List<RiverDetails> _graphdatalist = [];
  List<RiverDetails> get graphDataList =>_graphdatalist;
  int filtertype = 0;
  int graphindex = 0;

  void setgraphdata(List<RiverDetails> setGraphlist){
   _graphdatalist = setGraphlist;
  
    notifyListeners();
  
  
  }

  void setGraphIndex(int graphindex){
    this.graphindex = graphindex;
    notifyListeners();
  }


  void setFiltertype(int filtertype){

      this.filtertype = filtertype;
  }



}