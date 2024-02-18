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

      selectedIconTheme: IconThemeData(
          color: Colors.white,
        
        size: 20),
      

      selectedLabelTextStyle: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.surface),
      unselectedIconTheme: IconThemeData(color: Theme.of(context).colorScheme.surface,size: 16),
      backgroundColor: Theme.of(context).colorScheme.primary,
      leading: const SizedBox(height: 100,),
      useIndicator: true,
      labelType: NavigationRailLabelType.all,

      destinations: const [
       NavigationRailDestination(
         padding: EdgeInsets.symmetric(vertical: 40),
         icon: FaIcon(FontAwesomeIcons.house), label: Text('Home')), 
       NavigationRailDestination(
          padding: EdgeInsets.symmetric(vertical: 40),
         icon: FaIcon(FontAwesomeIcons.chartLine), label: Text('Charts')) ,
       NavigationRailDestination(
          padding: EdgeInsets.symmetric(vertical: 40),
         icon: FaIcon(FontAwesomeIcons.tableCells), label: Text('Tables')), 
       NavigationRailDestination(
          padding: EdgeInsets.symmetric(vertical: 40),
         icon: FaIcon(FontAwesomeIcons.gear), label: Text('Settings')), 
    ], 
    
    selectedIndex:_index
    
    );
  }
}