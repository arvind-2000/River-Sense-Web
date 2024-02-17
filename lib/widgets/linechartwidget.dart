import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:riversenseweb/graphfeatures/provider/graphprovider.dart';

import '../const.dart';
import 'package:riversenseweb/riversdata/models/riverdetailsentity.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({
    super.key,
    required this.graphdataprovider,
  });

  final GraphProvider graphdataprovider;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(24),
      child: LineChart(LineChartData(
        minY: 0,
        maxY: 300,
        borderData: FlBorderData(
          show: false
        ),
        gridData: const FlGridData(drawHorizontalLine: true,drawVerticalLine: false),
        titlesData: FlTitlesData(
          leftTitles:const AxisTitles(
          sideTitles: SideTitles(showTitles: false)
          ),
             topTitles:const AxisTitles(
            sideTitles: SideTitles(showTitles: false)
          ),
          bottomTitles:AxisTitles(
            axisNameWidget: Text(filternames[graphdataprovider.filtertype]),
            sideTitles: SideTitles(showTitles: true,
            interval: 1,
            getTitlesWidget: (value, meta)=>Text(graphdataprovider.filtertype==0?months[value.toInt()]:graphdataprovider.graphDataList[0].river[value.toInt()].date.day.toString()),
            )
          ) ,
        ),
      lineBarsData:graphdataprovider.graphDataList.asMap().entries.map((e) =>lineChartDataWidget(e.value,e.key)).toList())));
  }



  LineChartBarData lineChartDataWidget(RiverDetails e,int index) {
    return LineChartBarData(
          color:rivercolors[index],
      belowBarData: BarAreaData(show: true,
      // cutOffY: 150,
 
      applyCutOffY: true,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
        ,colors: [rivercolors[index]!.withOpacity(0.1),Colors.transparent])
      ),
      isCurved: true,
      preventCurveOverShooting: true,
      dotData: const FlDotData(show: false),
      spots:e.river.asMap().entries.map((e) => FlSpot(e.key.toDouble(), toDouble(e.value.usv).roundToDouble())).toList().take(20).toList()
    );
  }


  
}
