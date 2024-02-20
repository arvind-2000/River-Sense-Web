import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:riversenseweb/const.dart';
import 'package:riversenseweb/riversdata/models/riverdetailsentity.dart';
import 'package:riversenseweb/widgets/detailschartwidget.dart';
import 'package:riversenseweb/widgets/linechartwidget2.dart';
import 'package:riversenseweb/widgets/tables.dart';

class RiverDetailScreen extends StatefulWidget {
  const RiverDetailScreen({
    super.key,
   
  
  
  });
  static const String routename = "DetailScreen";

  @override
  State<RiverDetailScreen> createState() => _RiverDetailScreenState();
}

class _RiverDetailScreenState extends State<RiverDetailScreen> {
    final ScrollController _listcontroller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<dynamic>;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
    
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              DetailsImageSlider(args: args[1] as RiverDetails),

              Expanded(
                flex: 2,
                child:Row(
                  children: [
                   Expanded(
                     child: Column(
                     
                        children: [

                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [Colors.transparent,Theme.of(context).colorScheme.background],begin: Alignment.topCenter,end: Alignment.bottomCenter)
                              ),
                              child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Break Outs",style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                                  Row(children: List.generate(DateTime.now().year - 2022, (index) => Container( 
                                    padding: EdgeInsets.only(right: 16),
                                    child: Text('${2023+index}')))),
                                    Expanded(
                                      child: Container(
                                        child: Stack(
                                          children: [
                                        
                                            Positioned(
                                        
                                              child: Expanded(
                                                child: Container(
                                                width: 2,
                                                height: double.infinity,
                                                color: Theme.of(context).colorScheme.secondary,
                                                                                            ),
                                              )),

                                            ListView(
                                              shrinkWrap: true,
                                              children: [1,2,3,4,5,6,7,8,9,].map((e) =>BreakOutListCard(args:e)).toList(),
                                            ),

                           

                                          ],
                                        ),
                                      ),
                                    )
                                ],
                              )),
                          ),

                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal:16),
                                  decoration: BoxDecoration(
          
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(16)
        ),
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Monthly River Level',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    
                                    Text('$checktime minutes interval',style: TextStyle(fontSize: 12,color: Theme.of(context).colorScheme.surface.withOpacity(0.6))),
                                    SizedBox(height: 20,),
                                    LineCharts(isPinching: false, showcolorindicator:true),
                                  ],
                                )
                              ),
                            )
                        ],
                     
                     ),
                   ),

                         Expanded(
                     child: Column(
                       children: [
                        Expanded(child: Container(
                          child: DetailsChartWidget(isPinching: false, showcolorindicator: true, data: [args[1]]),
                        )),
                         Expanded(child: Tables(args: args[0], listcontroller:_listcontroller)),
                       ],
                     ),
                   )
                    ],
                ), )
            ],
          ),
        ),
      ),
    
    
    );
  }
}

class BreakOutListCard extends StatelessWidget {
  const BreakOutListCard({
    super.key,
    required this.args
  });
  final args;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [Container(width: 10,
        height: 10,
        margin: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,shape: BoxShape.circle ),),
        SizedBox(width: 20,),
        Container( 
          padding: EdgeInsets.all(16),
         
          width: 150,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color:Theme.of(context).colorScheme.secondary.withOpacity(0.4),
        ),
        
        child: Column(
          children: [
            Text('$args'),
            Text('$args'),
            Text('$args'),
          ],
        ),)
        ],
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