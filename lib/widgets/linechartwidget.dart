import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../const.dart';
import '../riversdata/provider/riverdataprovider.dart';
import 'package:riversenseweb/riversdata/models/riverdetailsentity.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({
    super.key,
    required this.riverdataprovider,
  });

  final RiverDataProvider riverdataprovider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(24),
      child: LineChart(LineChartData(
        maxY: 500,
        borderData: FlBorderData(
          show: false
        ),
        gridData: const FlGridData(drawHorizontalLine: true,drawVerticalLine: false),
        titlesData:const  FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false)
          ),
             topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false)
          )
        ),
      lineBarsData:riverdataprovider.allRiversDatalist.map((e) =>lineChartDataWidget(e)).toList())));
  }



  LineChartBarData lineChartDataWidget(RiverDetails e) {
    return LineChartBarData(
      belowBarData: BarAreaData(show: true,
      // cutOffY: 150,
      color: Colors.blue,
      applyCutOffY: true,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
        ,colors: [Colors.red,Colors.blue.withOpacity(0.3)])
      ),
      isCurved: true,
      preventCurveOverShooting: true,
      dotData: const FlDotData(show: false),
      spots:e.river.asMap().entries.map((e) => FlSpot(e.key.toDouble(), toDouble(e.value.usv).roundToDouble())).toList().take(20).toList()
    );
  }


  
}
