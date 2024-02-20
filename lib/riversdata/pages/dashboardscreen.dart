import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riversenseweb/const.dart';
import 'package:riversenseweb/riversdata/pages/riverdetailsscreen.dart';
import 'package:riversenseweb/tablefeatures/pages/tablescreen.dart';
import 'package:riversenseweb/widgets/smallcardwidget.dart';

import '../../BarChartfeatures/pages/barchartscreen.dart';
import '../../widgets/viewrivercardwidget.dart';
import '../provider/riverdataprovider.dart';
import '../../graphfeatures/pages/graphscreendesktop.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
      final riverProvider = Provider.of<RiverDataProvider>(context);
    return SizedBox(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                        child: Row(
                          children: riverProvider.allRiversDatalist.asMap().entries.map((e) =>ViewRiverCard(onPress: (){

                              Navigator.pushNamed(context, RiverDetailScreen.routename,arguments: [e.key,e.value]);

                          },riverDetails: e.value,)).toList(),
                        ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          
                          child: Row(
                            children: [
                              Expanded(
                                child: GraphScreenDesktop(),
                              ),
                    
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                              Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top:16,bottom: 16,right: 16,left: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Theme.of(context).colorScheme.primary
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Text("Predictions",style: TextStyle(fontSize: 20,),)
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal:16.0),
                                            child: Text(predictiondetail,style: TextStyle(fontSize: 12,color: Theme.of(context).colorScheme.surface.withOpacity(0.6)),)
                                          ),
                                          Expanded(
                                            child: Container(

                                                child: BarChartScreen(),
                                            
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  Divider(),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                                 const Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Text("Data Reports",style: TextStyle(fontSize: 20),),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(child: Center(child: Text('Date'))),
                                              ...riverProvider.allRiversDatalist.map((e) =>  Expanded(child: Center(child: Text(e.name.split(' ')[0]))),).toList()
                                             
                                          
                                         
                                            ],
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: double.infinity,
                                              margin: const EdgeInsets.only(top:16,bottom: 16,left: 8,right: 16),
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context).colorScheme.primary,
                                                borderRadius: BorderRadius.circular(16)
                                              ),
                                              child: TableScreen(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(16),
            child: Text("River Sense",style: TextStyle(fontSize: 12,wordSpacing: 6,letterSpacing: 4),),
          )
        ],
      ),
    );
  }
}

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BarChart(BarChartData(
                                  
    ));
  }
}

