import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:riversenseweb/const.dart';
import 'package:riversenseweb/riversdata/models/riverdetailsentity.dart';

class RiverDetailScreen extends StatelessWidget {
  const RiverDetailScreen({
    super.key,
   
  
  
  });
  static const String routename = "DetailScreen";


  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as RiverDetails;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
    
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              DetailsImageSlider(args: args),

              Expanded(
                flex: 2,
                child:Column(
                  children: [
                   Expanded(
                     child: Container(
                      
                     
                     ),
                   ),
                   Positioned(
                     bottom: 0,
                     child: Text( args.name,style: const TextStyle(fontSize: 30),)),
                    ],
                ), )
            ],
          ),
        ),
      ),
    
    
    );
  }
}

class DetailsImageSlider extends StatelessWidget {
  const DetailsImageSlider({
    super.key,
    required this.args,
  });

  final RiverDetails args;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      
      child: Stack(
         children: [
           CarouselSlider(
           
            options: CarouselOptions(
              autoPlay: true,
              autoPlayCurve: Curves.easeInOut,
              aspectRatio: 1/1,
             viewportFraction: 1,
              height: double.infinity
            ),
                              
            items: [0,1,2].map((e) =>Container(
               height: double.infinity,
              margin:const EdgeInsets.all(16),
                 color: Theme.of(context).colorScheme.background,
                 child: Image.asset('assets/images/riverss.png',fit: BoxFit.cover,),
             ),).toList(),
           
           ),
           Positioned.fill(
           
             
             child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              
               children: [
                 Container(
                  margin: EdgeInsets.all(16),
                height: 200,
                      width: double.infinity,                
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  
                  ),
                  padding: EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text( args.name,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DetailLevelsWidget(level: "Level",data: "${toDouble(args.river.last.usv).toStringAsFixed(0)} $levelunit",),
                        
                          DetailLevelsWidget(level: "Humidity",data: "${toDouble(args.river.last.hv).toStringAsFixed(0)} $humiditylevel",),
                          DetailLevelsWidget(level: "Temp",data: "${toDouble(args.river.last.tv).toStringAsFixed(0)} $templevel",),
                        
                        ],
                      )
                    ],
                  )),
               ],
             )),
         ],
       ),
    );
  }
}

class DetailLevelsWidget extends StatelessWidget {
  const DetailLevelsWidget({
    super.key,
    required this.level,
    required this.data
  });

  final String level;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(level),
        Text(data,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
      ],
                              ),
    );
  }
}