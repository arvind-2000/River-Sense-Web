import 'package:flutter/material.dart';
import 'package:riversenseweb/riversdata/models/riverdetailsentity.dart';

class Predictionprovider with ChangeNotifier{

  List<RiverDetails> _predictionlist = [];


  List<RiverDetails> get predictionlist =>_predictionlist; 



  
}