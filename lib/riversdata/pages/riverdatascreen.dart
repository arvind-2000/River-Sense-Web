import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riversenseweb/graphfeatures/provider/graphprovider.dart';
import 'package:riversenseweb/riversdata/provider/riverdataprovider.dart';
import 'package:riversenseweb/riversdata/provider/selectionprovider.dart';

import '../../widgets/navigationrailwidget.dart';
import 'dashboardscreen.dart';

class RiverDataScreen extends StatefulWidget {
  const RiverDataScreen({super.key});

  @override
  State<RiverDataScreen> createState() => _RiverDataScreenState();
}

class _RiverDataScreenState extends State<RiverDataScreen> {
@override
  void initState() {

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

    Provider.of<RiverDataProvider>(context,listen: false).getAllData();

      });
  
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
  
  
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body:const SafeArea(
          child: Row(
            children: [
              NavigationRailWidget(),
              Expanded(child: DashboardScreen())
            ],
          ),
        )

    );
  }
}


