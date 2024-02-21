import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riversenseweb/graphfeatures/provider/graphprovider.dart';

import '../const.dart';

import '../riversdata/models/riverdetailsentity.dart';

class TableList extends StatelessWidget {
   TableList({
    super.key,
    required this.filterRiver,
    required this.index,

  });
  final int index;
  final RiverDetails filterRiver;
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<GraphProvider>(context);
    return Expanded(
      child: Container(
     
        // width: (MediaQuery.of(context).size.width-0)/3,
        // color:       Theme.of(context).colorScheme.secondary.withOpacity(index%2==0?0.1:0.2),
      // decoration: BoxDecoration(
      //   border: Border.symmetric(vertical: BorderSide(color: Theme.of(context).colorScheme.surface.withOpacity(0.2)))
      // ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Center(child: Text(filterRiver.name.split(' ')[0])),
           Padding(
             padding: EdgeInsets.symmetric(horizontal:16.0),
             child: Center(child: Text(prov.graphlevelindex==0?'USV':prov.graphlevelindex==1?'HV':'TV')),
           ),
            ListView(
             shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children:
                filterRiver.river.map((e) => Container(
                  
                padding: EdgeInsets.all(16),
                       
               
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        
                        children: [
                        Text(prov.graphlevelindex==0?'${toDouble(e.usv).toStringAsFixed(0)} $levelunit':prov.graphlevelindex==1?'${toDouble(e.hv).toStringAsFixed(0)} $humiditylevel':'${toDouble(e.tv).toStringAsFixed(0)} $templevel'),
                      
                                          ]),

                                          
              Container(
                      height: 1,
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                    ),
                    ],
                  ),
            )).toList(),
            ),

          ],
        ),
      ),
    );
  }
}
