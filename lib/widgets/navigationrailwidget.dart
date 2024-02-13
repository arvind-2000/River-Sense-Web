import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../riversdata/provider/selectionprovider.dart';

class NavigationRailWidget extends StatefulWidget {
  const NavigationRailWidget({
    super.key,
  });

  @override
  State<NavigationRailWidget> createState() => _NavigationRailWidgetState();
}

class _NavigationRailWidgetState extends State<NavigationRailWidget> {

  int _index = 0;

  void changeRailIndex(int value){
    setState(() {
      _index = value;
    });
  }


  @override
  Widget build(BuildContext context) {
      final screenSelectionindex = Provider.of<SelectionProvider>(context);
    return NavigationRail(
      minWidth: 60,
      
      onDestinationSelected: (value){
        changeRailIndex(value);
      },

      selectedIconTheme: const IconThemeData(
        fill: 0.4,
        size: 20),
      unselectedIconTheme: IconThemeData(color: Theme.of(context).colorScheme.surface,size: 16),

      backgroundColor: Theme.of(context).colorScheme.primary,
      leading: const SizedBox(height: 200,),
      useIndicator: true,
      labelType: NavigationRailLabelType.selected,
      destinations: const [
       NavigationRailDestination(icon: FaIcon(FontAwesomeIcons.house), label: Text('Home')), 
       NavigationRailDestination(icon: FaIcon(FontAwesomeIcons.chartLine), label: Text('Charts')) ,
       NavigationRailDestination(icon: FaIcon(FontAwesomeIcons.tableCells), label: Text('Tables')), 
       NavigationRailDestination(icon: FaIcon(FontAwesomeIcons.gear), label: Text('Settings')), 
    ], 
    
    selectedIndex:_index
    
    );
  }
}