import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:riversenseweb/const.dart';
import 'package:riversenseweb/graphfeatures/provider/graphprovider.dart';
import 'package:riversenseweb/riversdata/provider/riverdataprovider.dart';

import '../../widgets/linechartwidget.dart';

class GraphScreenDesktop extends StatelessWidget {
  const GraphScreenDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final graphprovider = Provider.of<GraphProvider>(context);
    final riverdataprovider = Provider.of<RiverDataProvider>(context); 
    return Container(
      height: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
    clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(16)
      ),

      child:Column(
        children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Nambul River",style: TextStyle(fontWeight: FontWeight.bold),),
              
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16,horizontal: 26),
                padding:const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Theme.of(context).colorScheme.surface.withOpacity(0.4))
                ),
                child: Row(
                  children: [
                    Text('Monthly'),
                    IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.arrowRight,size: 12, ),tooltip: 'Choose time',)
                  ],
                ),


              )

            ],
          ),
          Expanded(child: LineChartWidget(riverdataprovider: riverdataprovider)),
          Container(height: 100,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 12,
                    childAspectRatio: 1.5/1,
                    mainAxisSpacing: 2
                  ),
                  
                  shrinkWrap: true,
                  children: months.map((e) => Container(
                   margin: EdgeInsets.symmetric(horizontal: 4),
                  padding:const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Theme.of(context).colorScheme.surface.withOpacity(0.4))
                  ),
                  child: Center(child: Text(e,style: TextStyle(fontSize: 12),)),
                  )).toList(),
                ),
              ),
          
            ],
            
          ),
          )
        ],
      )
      
    );
  }
}

