import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riversenseweb/tablefeatures/pages/tablescreen.dart';

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
                    children: riverProvider.allRiversDatalist.map((e) =>ViewRiverCard(onPress: (){log("card 1");},riverDetails: e,)).toList(),
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
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text("Bar Graph",style: TextStyle(fontWeight: FontWeight.bold),),
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
                                           Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text("Data Reports",style: TextStyle(fontWeight: FontWeight.bold),),
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

