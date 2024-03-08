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
    
    return Container(
      width: 200,
      color: Theme.of(context).colorScheme.primary,
    
      child:const  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Leading(),
          Expanded(child: NavigationItems())

        ],
      ),
    );
  }
}


class Leading extends StatelessWidget {
  const Leading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text('River Sense',style: TextStyle(fontSize: 24),)

    );
  }
}

class NavigationItems extends StatelessWidget {
  const NavigationItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      child: const Column(
    
        children: [
          ItemIcons(icon:FontAwesomeIcons.house,label:"Home",index: 0),
          ItemIcons(icon:FontAwesomeIcons.chartLine,label:"Charts",index: 1,),
          ItemIcons(icon:FontAwesomeIcons.tableCells,label:"Tables",index: 2,),
          ItemIcons(icon:FontAwesomeIcons.gear,label:"Settings",index: 3,),
        ],
      ),
    );
  }
}

class ItemIcons extends StatelessWidget {

  const ItemIcons({super.key,
  required this.icon,
  required this.label,
  required this.index,
  });
  final IconData icon;
  final String label;
  final int index;
  @override
  Widget build(BuildContext context) {
      final screenSelectionindex = Provider.of<SelectionProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: (){
          screenSelectionindex.changeNavigationRailIndex(index);
        },
        child: Container(
          padding: EdgeInsets.only(left: 16,top: 24,bottom: 24,),
         
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
             color: screenSelectionindex.railIndex==index?Theme.of(context).colorScheme.background:Theme.of(context).colorScheme.primary,
          ),
         
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
        
         
              
              Row(
                children: [
                  FaIcon(icon,size: 14,color:screenSelectionindex.railIndex==index?Theme.of(context).colorScheme.secondary:null,),
                  SizedBox(width: 20,),
                  Text(label),
                ],
              ),
                 screenSelectionindex.railIndex==index?Container(
                height: 10,
                width: 10,
                margin: EdgeInsets.symmetric(horizontal: 16),
               padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.secondary
                ),
              ):SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}