import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riversenseweb/const.dart';
import 'package:riversenseweb/graphfeatures/provider/graphprovider.dart';

class BarChartScreen extends StatelessWidget {
  const BarChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<GraphProvider>(context);
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
      padding:const EdgeInsets.all(16),
      color: Theme.of(context).colorScheme.primary,
      child: BarChart(
        BarChartData(
          gridData:const FlGridData(
            show: false
          ),
          borderData: FlBorderData(
            border: Border(
              top: BorderSide.none,
              right: BorderSide.none
            )
          ),
          titlesData:const FlTitlesData(
            leftTitles: AxisTitles(
              axisNameWidget: Text('Levels'),
              sideTitles: SideTitles(showTitles: false)
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false
              )
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false
              )
            ),
            bottomTitles: AxisTitles(
              axisNameWidget: Text('Rivers'),
              sideTitles: SideTitles(
                showTitles: false,


              )
            )
          ),
          maxY: 500,
          minY: 0,
          barGroups: prov.graphDataList[0].river.asMap().entries.map((e) => BarChartGroupData(x:e.key,barRods: [BarChartRodData(
            
            width: 20,
            color: Theme.of(context).colorScheme.surface.withOpacity(0.3),
            borderRadius: BorderRadius.circular(0),
            toY:toDouble(e.value.usv).roundToDouble())] )).toList()
        )
      ),
    );
  }
}