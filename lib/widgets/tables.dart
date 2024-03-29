

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riversenseweb/riversdata/provider/riverdataprovider.dart';

import '../const.dart';

import 'cards.dart';

class Tables extends StatelessWidget {
  const Tables({
    super.key,
    required this.args,
    required ScrollController listcontroller,
  }) : _listcontroller = listcontroller;


  final int args;
  final ScrollController _listcontroller;

  @override
  Widget build(BuildContext context) {
    final prov2 = Provider.of<RiverDataProvider>(context);
    print("in tables${prov2.allRiversDatalist[args].river.length}");
    prov2.allRiversDatalist[args].river.sort((a, b) => a.date.compareTo(b.date),);
    return CardsContainer(
      margins: EdgeInsets.only(left: 16,right: 16,bottom: 16),
      cardcolor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
      
      childs: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:const EdgeInsets.all(8),
              child:const  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text("Date/time",textAlign: TextAlign.center,)),
                  Expanded(child: Text("Water\nLevel\n$levelunit",textAlign: TextAlign.center,)),
                  Expanded(child: Text("humidity\n$humiditylevel",textAlign: TextAlign.center,)),
                  Expanded(child: Text("Temp\n$templevel",textAlign: TextAlign.center,)),
                ],
              ),
            ),
              prov2.allRiversDatalist.isEmpty? Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary,)):args>=prov2.allRiversDatalist.length?SizedBox():ListView(
                controller:_listcontroller,
                physics:const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children:   prov2.allRiversDatalist[args].river.asMap().entries.where((element) => element.value.date.year==DateTime.now().year).map((e) => Container(
              
                  padding: const EdgeInsets.all(8),
                  child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                  Expanded(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center ,
                        
                        children: [
                          Text('${getDate(e.value.date)}',style: TextStyle(fontSize:12,fontWeight: FontWeight.bold),),
                        
                          Text('${gethour(e.value.date)}',style: TextStyle(fontSize:12,),),
                       
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      
                      padding: EdgeInsets.all(4),
                     
                      child: Text('${toDouble(e.value.usv).toStringAsFixed(2)}',textAlign: TextAlign.center,)),
                  ),
                  
                       Expanded(
                         child: Container(
                                             
                                             padding: EdgeInsets.all(4),
                                            
                                             child: Text('${toDouble(e.value.hv).toStringAsFixed(2)}',textAlign: TextAlign.center,)),
                       ),
                    
               Expanded(
                 child: Container(
                      
                      padding: EdgeInsets.all(4),
                     
                      child: Text('${toDouble(e.value.tv).toStringAsFixed(2)}',textAlign: TextAlign.center,)),
               ),
                   
                ],), color:toDouble(e.value.usv)>threshold.toDouble()?Theme.of(context).colorScheme.error.withOpacity(0.2) :e.key%2==0?Theme.of(context).colorScheme.secondary.withOpacity(0.1):Theme.of(context).colorScheme.secondary.withOpacity(0.2)),).toList().reversed.take(prov2.allRiversDatalist[args].river.length>10?10:prov2.allRiversDatalist[args].river.length).toList()
              ),
          ],
        ),
      ),
    );
  }
}