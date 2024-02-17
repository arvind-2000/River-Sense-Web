import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:riversenseweb/graphfeatures/provider/graphprovider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../const.dart';
import '../riversdata/models/riverdetailsentity.dart';
import '../riversdata/models/riverentities.dart';



class LineCharts extends StatefulWidget {
  LineCharts({
    super.key,
    required this.isPinching,
    required this.showcolorindicator,
    this.index = 0,
  });
  final int index;
  final bool isPinching;
  final bool showcolorindicator;

  @override
  State<LineCharts> createState() => _LineChartsState();
}

class _LineChartsState extends State<LineCharts> {
  int val = 20;


  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<GraphProvider>(context);
    return Stack(
      children: [
        

      prov.graphDataList[0].river.isEmpty?const SizedBox(
        child: Center(child: Text('No Data'),),
       ):Container(
        margin:const EdgeInsets.symmetric(horizontal: 16),
        padding:const EdgeInsets.only(left: 24,top: 16),
        decoration: BoxDecoration(
          
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(16)
        ),
         child: SfCartesianChart(
            zoomPanBehavior: ZoomPanBehavior(
         
              enableMouseWheelZooming: true,
              enablePanning: true,
              
              // maximumZoomLevel: 1,  
              // enablePinching: true,
           
              zoomMode: ZoomMode.x,
              enableSelectionZooming: true
         
            ),
            tooltipBehavior: TooltipBehavior(enable: true,
            color: Theme.of(context).colorScheme.primary,
            textStyle: TextStyle(color: Theme.of(context).colorScheme.surface)
            ),
            borderWidth: 0,
            borderColor: Colors.transparent,
            margin: EdgeInsets.zero,
            plotAreaBorderColor: Colors.transparent,
            plotAreaBorderWidth: 0,
            // title: ChartTitle(
            //   text: prov.graphDataList[0].name,
            //   alignment: ChartAlignment.near,
            //   borderWidth: 8
            // ),
            enableAxisAnimation: true,
              
            primaryYAxis: NumericAxis(
            desiredIntervals: 5,
              minimum: 0.0,
              maximum:400,
            ),
          primaryXAxis: DateTimeAxis(
                  initialVisibleMinimum: DateTime(DateTime.now().year,DateTime.now().month,1),
                  interval:10,
                  dateFormat: DateFormat('dd-mm-y'),
                  title: AxisTitle(
                    text: "Time"
                  ),
                  autoScrollingMode:AutoScrollingMode.end,
                  autoScrollingDelta: val,
                  autoScrollingDeltaType: DateTimeIntervalType.hours,
            initialZoomPosition: 1,
            initialZoomFactor: 0.2,
           
            
                  
          ),
          series: prov.graphDataList.asMap().entries.map((e) => linecharts(e.value, e.key,Theme.of(context).colorScheme.secondary,prov)).toList(),
         ),
       ),
       Positioned(
            right: 0,
            top: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children:[
                    IconButton(onPressed: (){
                          setState(() {
                            if(val<=20)
                          {
                            val = 20;
                          }
                            else{
                              val = val - 20;
                            }
                          });
                
                      
                    }, icon:const FaIcon(FontAwesomeIcons.plus,size: 20,)),
                    IconButton(onPressed: (){
                        setState(() {
                                 if(val>=100)
                          {
                            val = 100;
                          }
                            else{
                              val = val + 20;
                            }
                        });
                
                    }, icon:const FaIcon(FontAwesomeIcons.minus,size: 16,),hoverColor: Theme.of(context).colorScheme.secondary,),
                  ]
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(prov.graphlevelindex==0?levelunit:prov.graphlevelindex==1?humiditylevel:templevel),
                )
              ],
            ),
          ),
        ),
    
     
        
      ],
    );
  }

  BarChartGroupData BarChartgroupdata(MapEntry<int, RiverDetails> r) =>
      BarChartGroupData(
        x: r.key,
        // barsSpace: 20,
        barRods: [
          BarChartRodData(
              width: 20,
              borderRadius: BorderRadius.zero,
              gradient: LinearGradient(
                  colors: [Colors.orange.shade300, Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              toY: toDouble(r.value.river.last.usv)),
          BarChartRodData(
             width: 20,
              borderRadius: BorderRadius.zero,
              gradient: LinearGradient(
                  colors: [Colors.blue.shade300, Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            toY: toDouble(r.value.river.last.hv)),
          BarChartRodData(
             width: 20,
              borderRadius: BorderRadius.zero,
              gradient: LinearGradient(
                  colors: [Colors.purple.shade300, Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            toY: toDouble(r.value.river.last.tv)),
        ],
      );

  SplineAreaSeries<River, DateTime> linecharts(
    RiverDetails riversdata,
    int index,
    Color color,
    GraphProvider prov
  ) {
    return SplineAreaSeries(
        animationDelay: 1,
        animationDuration: 0.3,
        enableTooltip: true,
        markerSettings: MarkerSettings(
          isVisible: true,

          color:color.withOpacity(0.4),
          borderWidth: 0,
          shape: DataMarkerType.circle
        ),
        borderColor: rivercolors[index]!,
        borderWidth: 2,
        splineType: SplineType.natural,
        gradient: LinearGradient(
            colors: [Colors.transparent, Colors.transparent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        dataSource: riversdata.river,
        xValueMapper: (datum, index) {
          return datum.date;
        },
        yValueMapper: (d, i) => toDouble(prov.graphlevelindex == 0
            ? d.usv
            : prov.graphlevelindex == 1
                ? d.hv
                : d.tv));
  }
}