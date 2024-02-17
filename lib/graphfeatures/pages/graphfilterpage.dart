import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../const.dart';
import '../../riversdata/provider/riverdataprovider.dart';
import '../../widgets/smallcardwidget.dart';
import '../provider/graphprovider.dart';

class GraphFilterPage extends StatelessWidget {
  const GraphFilterPage({
    super.key,
    required this.isVisible
  });
  final Function isVisible;
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
               children: [
                 FaIcon(FontAwesomeIcons.filter,size: 12,),
                 Text('Filter',style: TextStyle(fontWeight: FontWeight.bold)),
               ],
             ),
             IconButton(onPressed: (){

               isVisible();
             }, icon:const  FaIcon(FontAwesomeIcons.xmark,size: 12,))
          ],
        ),
        Divider(),
          const SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("River",style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10,),
              Row(
                children:[Padding( padding: const EdgeInsets.only(right: 8),
                  child: InkWell(
                    onTap: (){
                      graphprovider.setGraphRiverIndex(4);
                    },
                    child: SmallCardWidget(name:"All",selected: graphprovider.graphRiverindex>2)),
                ) ,...riverprovider.allRiversDatalist.asMap().entries.map((e) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: InkWell(
                    onTap: (){
                      graphprovider.setGraphRiverIndex(e.key);
                    },
                    child:SmallCardWidget(name:e.value.name.split(' ')[0],selected: graphprovider.graphRiverindex==e.key,)),
                )).toList()]
              ),
            ],
          ),
           SizedBox(height: 30,),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     const Text('Sensor',style: TextStyle(fontWeight: FontWeight.bold)),
                     SizedBox(height: 20,),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                                  children: sensorslist.asMap().entries.map((e) => InkWell(
                                    onTap: (){
                                      graphprovider.setGraphLevelIndex(e.key);
                                    },
                                    child: SmallCardWidget(name:e.value,selected: graphprovider.graphlevelindex==e.key,))).toList(),
                                ),
                    ],
                  ),
          SizedBox(height: 30,),
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
          childAspectRatio: 1.5/1.3,
          mainAxisSpacing: 2,

        ),
        
        shrinkWrap: true,
        children: months.asMap().entries.map((e) => InkWell(
          onTap: (){
            graphprovider.setDate(DateTime(graphprovider.date.year,e.key+1));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SmallCardWidget(name: e.value,selected: e.key+1==graphprovider.date.month,),
          ))).toList(),
      ):const  SizedBox(),
    
        ],
      ),
    ).animate().fade().slide();
  }
}