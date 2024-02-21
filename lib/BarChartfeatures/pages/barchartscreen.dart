import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:riversenseweb/graphfeatures/provider/graphprovider.dart';
import 'package:riversenseweb/widgets/errorscreen.dart';

class BarChartScreen extends StatelessWidget {
  const BarChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<GraphProvider>(context);
    return prov.graphDataList.isEmpty?ErrorScreen():Container(
      margin:const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
      padding:const EdgeInsets.all(16),
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        children: [
    
        ],
      )
    );
  }
}