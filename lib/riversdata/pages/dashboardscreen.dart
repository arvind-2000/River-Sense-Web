import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                      Expanded(
                    child: Container(
                      height: double.infinity,
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.circular(16)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

