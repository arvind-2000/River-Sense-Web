import 'package:flutter/material.dart';
import 'package:riversenseweb/const.dart';
import 'package:riversenseweb/riversdata/models/riverdetailsentity.dart';

class ViewRiverCard extends StatelessWidget {
  const ViewRiverCard({super.key,
  required this.onPress,
  required this.riverDetails
  });
  
  final RiverDetails riverDetails;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor: MouseCursor.uncontrolled,
      onTap: (){
        onPress();
      },
      child: Stack(
        children: [
      
          Positioned(
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0.5, 0.5))
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(riverDetails.name,style: const TextStyle(fontWeight: FontWeight.bold),),
                    Container(
                      padding:const EdgeInsets.all(16),
                           decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                      child: Row(
                        children: [
                          Text(riverDetails.river.last.usv),
                          SizedBox(width: 10,),
                          Text(riverDetails.river.last.hv),
                          SizedBox(width: 10,),
                          Text(riverDetails.river.last.tv),
                        ],
                      ),
                    ),
                  ],
                ),
            ),
          ),
    
                 Positioned(
                  right: 0,
                                 child: Container(
                  margin: const EdgeInsets.all(8),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                      color: rivercolors[0],
                  ),
                                 ),
                               ),
        ],
      ),
    );
  }
}