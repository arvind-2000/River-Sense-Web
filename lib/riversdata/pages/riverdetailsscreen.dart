import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riversenseweb/const.dart';
import 'package:riversenseweb/graphfeatures/provider/graphprovider.dart';
import 'package:riversenseweb/riversdata/models/riverdetailsentity.dart';
import 'package:riversenseweb/riversdata/models/riverentities.dart';
import 'package:riversenseweb/riversdata/provider/riverdataprovider.dart';
import 'package:riversenseweb/widgets/detailschartwidget.dart';
import 'package:riversenseweb/widgets/tables.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
    final prov = Provider.of<GraphProvider>(context);
    final prov2 = Provider.of<RiverDataProvider>(context);
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
                                  Text("${args[1].name}",style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                                  
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
                                    SfCartesianChart(
           
            zoomPanBehavior: ZoomPanBehavior(
         
              enableMouseWheelZooming: true,
              enablePanning: true,
              
              // maximumZoomLevel: 1,  
              // enablePinching: true,
           
              zoomMode: ZoomMode.x,
              enableSelectionZooming: true
         
            ),

            tooltipBehavior: TooltipBehavior(enable: true,
            color: Theme.of(context).colorScheme.primary,
            textStyle: TextStyle(color: Theme.of(context).colorScheme.surface)
            ),
            borderWidth: 0,
        
            borderColor: Colors.transparent,
            margin: EdgeInsets.zero,
            plotAreaBorderColor: Colors.transparent,
            plotAreaBorderWidth: 0,
            // title: ChartTitle(
            //   text: prov.graphDataList[0].name,
            //   alignment: ChartAlignment.near,
            //   borderWidth: 8
            // ),
            enableAxisAnimation: true,

            
            primaryYAxis:const NumericAxis(
    
                 majorGridLines: MajorGridLines(
            
             width: 0
           ),
            desiredIntervals: 10,

              minimum: 0.0,
              interval: 50,
              maximum: 300,
              
            ),
          primaryXAxis: NumericAxis(
               majorGridLines: MajorGridLines(
                 
             width: 0
           ),
           initialVisibleMaximum: 13,
                // axisLabelFormatter:(axisLabelRenderArgs) => ChartAxisLabel(prov.filtertype==0?months[int.parse(axisLabelRenderArgs.text)]:axisLabelRenderArgs.text, TextStyle(fontSize:12)),
                axisLabelFormatter: prov.filtertype==0?(axisLabelRenderArgs) => ChartAxisLabel(months[int.parse(axisLabelRenderArgs.text)],const TextStyle(fontSize:12)) :null,
                  interval:1,
                  
                  // maximum: prov.filtertype==0?12:null,
                  title: AxisTitle(
                  
                    text: "Time"
                  ),
                  autoScrollingMode:AutoScrollingMode.end,
                  // autoScrollingDelta: val,

            // initialZoomPosition: 1,
            // initialZoomFactor: 0.2,
           
            
                  
          ),
          series:prov2.getMonths([prov2.allRiversDatalist[args[0]]],DateTime.now()) .asMap().entries.map((e) =>linecharts(e.value, e.key,Theme.of(context).colorScheme.secondary,prov) ).toList(),
         ),
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

    SplineAreaSeries<River, int> linecharts(
    RiverDetails riversdata,
    int index,
    Color color,
    GraphProvider prov
  ) {
    return SplineAreaSeries(
        animationDelay: 1,
        animationDuration: 0.3,
        enableTooltip: true,
        markerSettings: MarkerSettings(
          isVisible: true,
          
          color:color.withOpacity(0.4),
          borderWidth: 0,
          shape: DataMarkerType.circle
        ),
        borderColor: rivercolors[index]!,
        borderWidth: 2,
        splineType: SplineType.cardinal,
        cardinalSplineTension: 0.3,
        gradient: LinearGradient(
            colors: [rivercolors[index]!.withOpacity(0.2), Colors.transparent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        dataSource: riversdata.river,
        emptyPointSettings: EmptyPointSettings(
          mode: EmptyPointMode.average
          
        ),
        xValueMapper: (datum, index) {
          return index;
        },
      
        yValueMapper: (d, i) => toDouble(prov.graphlevelindex == 0
            ? d.usv
            : prov.graphlevelindex == 1
                ? d.hv
                : d.tv));
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