import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:riversenseweb/const.dart';
import 'package:riversenseweb/graphfeatures/provider/graphprovider.dart';
import 'package:riversenseweb/riversdata/provider/riverdataprovider.dart';

import '../../widgets/linechartwidget.dart';
import '../../widgets/smallcardwidget.dart';
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
  
  @override
  Widget build(BuildContext context) {
    final graphprovider = Provider.of<GraphProvider>(context);
    final riverprovider = Provider.of<RiverDataProvider>(context);
    
    return Container(
      height: double.infinity,
      margin: const EdgeInsets.only(top: 16,bottom: 16,left: 16,right: 8),
      padding: const EdgeInsets.all(16),
    clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(16)
      ),

      child:Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(graphprovider.graphRiverindex<=2?riverprovider.allRiversDatalist[graphprovider.graphRiverindex].name:"All",style:const TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16,horizontal: 26),
                      padding:const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Theme.of(context).colorScheme.surface.withOpacity(0.4))
                      ),
                      child: IconButton(onPressed: (){
                         
                        setState(() {
                          isFilterVisible = !isFilterVisible;
                        });  
                                  
                      }, icon: FaIcon(isFilterVisible?FontAwesomeIcons.xmark: FontAwesomeIcons.filter,size: 12,),tooltip: 'Set filters',),
            
            
                    )
            
                  ],
                ),
                Expanded(child: LineChartWidget(graphdataprovider:graphprovider)),
           
                
              ],
            ),
          ),
          isFilterVisible?GraphFilterPage():SizedBox()
        ],
      )
      
    );
  }
}




