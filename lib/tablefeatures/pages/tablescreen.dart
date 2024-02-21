import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:riversenseweb/const.dart';
import 'package:riversenseweb/tablefeatures/provider/tableprovider.dart';
import 'package:riversenseweb/widgets/errorscreen.dart';

import '../../widgets/tablelist.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<TableProvider>(context);
    return prov.tableDataList.isEmpty?ErrorScreen():Container(

        child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  
                      // prov.tableDataList!=0?Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 16),
                      //   child: Text( prov.tableDataList==1?"${prov.date.year}":"${months[prov.date.month-1]} ${prov.date.year}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                      // ):SizedBox(),
                       Container(
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.only(top: 8),
                        color:
                            Theme.of(context).colorScheme.primary.withOpacity(0.3),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          
                          children: [
                            Expanded(
                              child: ListView(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                    const Center(child: FaIcon(FontAwesomeIcons.calendar,size: 16,)),
                                    SizedBox(height: 3,),
                                  Center(child: Text(getDate(prov.date))),
                                
                                  ...prov.tableDataList[prov.maxIndex]
                                      .river
                                      .map((e) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 8),
                                            child: Container(
                                                width: double.infinity,
                                                alignment: Alignment.center,
                                                child: Text(
                                                    '${prov.filtertype == 0 ? months[e.date.month - 1] : e.date.day}')),
                                          ))
                                ],
                              ),
                            ),
                            ...prov.tableDataList
                                .asMap()
                                .entries
                                .map((e) =>
                                    TableList(filterRiver: e.value, index: e.key))
                                .toList()
                          ],
                        ),
                                               ),
                    ],
                  ),
                ),

    );
  }
}