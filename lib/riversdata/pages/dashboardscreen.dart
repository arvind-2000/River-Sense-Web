import 'dart:developer';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:riversenseweb/const.dart';
import 'package:riversenseweb/riversdata/pages/riverdetailsscreen.dart';


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
      child: Expanded(
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      Padding(
        padding: const EdgeInsets.all(16),
        child: Text('Dashboard',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
      ),
                  Container(
                  child: Row(
                    children: riverProvider.allRiversDatalist.map((e) =>Expanded(child: ViewRiverCard(onPress: (){log("card 1");},riverDetails: e,))).toList(),
                  ),
                  ),
      
              // Expanded(
              //       flex: 4,
              //       child: Container(
                      
              //         child: Row(
              //           children: [
              //             Expanded(
              //               flex: 3,
              //               child:Container(
                            
              //             margin: EdgeInsets.symmetric(vertical:8,horizontal: 16),
              //             decoration: BoxDecoration(
              //               color: Theme.of(context).colorScheme.primary,
              //               borderRadius: BorderRadius.circular(16)
              //             ),
              //               ),
              //             ),
              //             Expanded(
              //               flex: 1,
              //               child:Container(
              //                 //predictions
              //               margin: EdgeInsets.only(top:8,right: 8,bottom: 16),
              //             decoration: BoxDecoration(
              //               color: Theme.of(context).colorScheme.secondary,
              //               borderRadius: BorderRadius.circular(16)
              //             ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
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
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16)),
                              color: Theme.of(context).colorScheme.primary
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text("Prediction",style: TextStyle(fontWeight: FontWeight.bold),),
                                        ),
                                        Expanded(
                                          child: Container(
                                            
                                              child: BarChartScreen(),
                                          
                                          ),
                                        ),
                                      ],
                                    ),
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

