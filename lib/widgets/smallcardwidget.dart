import 'package:flutter/material.dart';

class SmallCardWidget extends StatelessWidget {
  const SmallCardWidget({
    super.key,
    required this.name,
    this.selected = false
  });
  final String name;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Container(
    
     margin:const EdgeInsets.symmetric(horizontal: 4),
    padding:const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: selected?Theme.of(context).colorScheme.secondary.withOpacity(0.2):Colors.transparent,
      borderRadius: BorderRadius.circular(16),
        border: Border.all(color:selected?Theme.of(context).colorScheme.secondary.withOpacity(0.4):Theme.of(context).colorScheme.surface.withOpacity(0.4))
    ),
    child: Center(child: Text(name,style: TextStyle(fontSize: 12,fontWeight:selected?FontWeight.bold:FontWeight.normal, ),)),
    );
  }
}
