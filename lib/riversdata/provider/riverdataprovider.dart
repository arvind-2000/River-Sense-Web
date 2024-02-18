import 'package:flutter/material.dart';
import 'package:riversenseweb/const.dart';
import 'package:riversenseweb/dummiesdata.dart';
import 'package:riversenseweb/riversdata/business/riverservices.dart';
import 'package:riversenseweb/riversdata/models/riverdetailsentity.dart';

class RiverDataProvider with ChangeNotifier{

  List<RiverDetails> _allRiversData = [];

  List<RiverDetails> get allRiversDatalist => _allRiversData; 

  bool isLoading = true;
  int river_response = 0;
  



  Future<void> getAllData() async{
  //   RiverService? service = RiverService();
  //     await service.getdata(apicalls).then((value){
              
  //       river_response = service!.responsecode;
  //       _allRiversData = value;
  //       isLoading = false;
  //       notifyListeners();
  //     });
  // service = null;
  //
  //TODO: dummy methods 
  river_response = 200;
  _allRiversData = dummies;
  isLoading = false;

  notifyListeners();
  
  }

 




}