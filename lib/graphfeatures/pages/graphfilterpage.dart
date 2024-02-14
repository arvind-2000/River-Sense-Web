import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const.dart';
import '../../riversdata/provider/riverdataprovider.dart';
import '../../widgets/smallcardwidget.dart';
import '../provider/graphprovider.dart';

class GraphFilterPage extends StatelessWidget {
  const GraphFilterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
      final graphprovider = Provider.of<GraphProvider>(context);
      final riverprovider = Provider.of<RiverDataProvider>(context);
    return Container(
      padding: EdgeInsets.all(16),
      height: double.infinity,                  
      width: 300,
    
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16)
        
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Text('Filter'),

           SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Choose River"),
              SizedBox(height: 10,),
              Row(
                children: riverprovider.allRiversDatalist.asMap().entries.map((e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: (){
                      graphprovider.setGraphRiverIndex(e.key);
                    },
                    child: Text(e.value.name.split(' ')[0])),
                )).toList(),
              ),
            ],
          ),
           SizedBox(height: 20,),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Choose Sensor'),
                      Row(
                                  children: sensorslist.asMap().entries.map((e) => Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: InkWell(
                                      onTap: (){
                                        graphprovider.setGraphLevelIndex(e.key);
                                      },
                                      child: Text(e.value)),
                                  )).toList(),
                                ),
                    ],
                  ),
          SizedBox(height: 20,),
         Row(
           children: [
             InkWell(
              onTap: (){
                  graphprovider.setFiltertype(0);
                   graphprovider.changeData();
              },
              child:Text("Months",style: TextStyle(color:graphprovider.filtertype==0?Theme.of(context).colorScheme.secondary:Theme.of(context).colorScheme.surface),)),
              SizedBox(width: 20,),
             InkWell(
                  onTap: (){
                  graphprovider.setFiltertype(1);
                    graphprovider.changeData();
              },
              child:Text("Days",style: TextStyle(color:graphprovider.filtertype==1?Theme.of(context).colorScheme.secondary:Theme.of(context).colorScheme.surface),)),
           ],
         ),
         SizedBox(height: 10,),
      graphprovider.filtertype==0?Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:List.generate(DateTime.now().year - 2022, (index) => InkWell(
          onTap: (){
              graphprovider.setDate(DateTime(DateTime.now().year-index));
          },
          child: SmallCardWidget(name:'${DateTime.now().year-index}',selected: DateTime.now().year-index==graphprovider.date.year))).toList() ,
      ):graphprovider.filtertype==1?GridView(
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
          childAspectRatio: 1.5/1,
          mainAxisSpacing: 2
        ),
        
        shrinkWrap: true,
        children: months.asMap().entries.map((e) => InkWell(
          onTap: (){
            graphprovider.setDate(DateTime(graphprovider.date.year,e.key+1));
          },
          child: SmallCardWidget(name: e.value,selected: e.key+1==graphprovider.date.month,))).toList(),
      ):const  SizedBox(),
    
        ],
      ),
    );
  }
}