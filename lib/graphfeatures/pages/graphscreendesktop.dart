import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:riversenseweb/graphfeatures/provider/graphprovider.dart';
import 'package:riversenseweb/riversdata/provider/riverdataprovider.dart';
import 'package:riversenseweb/widgets/errorscreen.dart';
import 'package:riversenseweb/widgets/linechartwidget2.dart';
import '../../const.dart';
import 'graphfilterpage.dart';

class GraphScreenDesktop extends StatefulWidget {
  const GraphScreenDesktop({
    super.key,
  });

  @override
  State<GraphScreenDesktop> createState() => _GraphScreenDesktopState();
}

class _GraphScreenDesktopState extends State<GraphScreenDesktop> {

    bool isFilterVisible = false;
    @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
  }

  void changeFilter(){
    setState(() {
            isFilterVisible = !isFilterVisible;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final graphprovider = Provider.of<GraphProvider>(context);
    final riverprovider = Provider.of<RiverDataProvider>(context);
    
    return graphprovider.graphDataList.isEmpty?ErrorScreen():Container(
      height: double.infinity,
      margin: const EdgeInsets.only(top: 16,bottom: 16,left: 16,right: 8),
      padding: const EdgeInsets.all(16),
    clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8)
      ),

      child:Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.end,
              children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("River Levels",style: TextStyle(fontSize: 24,letterSpacing: 3),),
                          SizedBox(height: 10,),
                          // Text(graphdetail,style: TextStyle(fontSize: 14,color: Theme.of(context).colorScheme.surface.withOpacity(0.6)),),
                          // const SizedBox(height: 20,),
                          Text(graphprovider.graphRiverindex<=2?riverprovider.allRiversDatalist[graphprovider.graphRiverindex].name:"All Rivers",style:const TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
            
                   isFilterVisible?const SizedBox():Container(
                      margin: const EdgeInsets.symmetric(vertical: 16,horizontal: 26),
                      padding:const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Theme.of(context).colorScheme.surface.withOpacity(0.4))
                      ),
                      child: IconButton(onPressed: (){
                         
                        changeFilter();
                                  
                      }, icon: FaIcon(isFilterVisible?FontAwesomeIcons.xmark: FontAwesomeIcons.filter,size: 12,),tooltip: 'Set filters',),
            
            
                    )
            
                  ],
                ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                        children:graphprovider.graphDataList.asMap().entries.map((e) => Container(
                          padding:const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                  
                     
                            Text(e.value.name.split(' ')[0]),
                                   SizedBox(width: 10,),
                                     Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: rivercolors[e.key],
                                shape: BoxShape.circle
                            ),
                           ),
                            ],))).toList(),
                      ),


                Expanded(child:  LineCharts(isPinching: false,showcolorindicator: true,)),
           
                
              ],
            ),
          ),
          isFilterVisible?GraphFilterPage(isVisible: changeFilter,):SizedBox()
        ],
      )
      
    );
  }
}




