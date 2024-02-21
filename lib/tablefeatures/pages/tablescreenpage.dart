import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riversenseweb/const.dart';
import 'package:riversenseweb/tablefeatures/provider/tableprovider.dart';
import 'package:riversenseweb/widgets/cards.dart';

import '../../riversdata/provider/riverdataprovider.dart';
import 'tablescreen.dart';

class TableScreenPage extends StatelessWidget {
  const TableScreenPage({
    super.key,

  });

 

  @override
  Widget build(BuildContext context) {
    final tableprovider = Provider.of<TableProvider>(context);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                 const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Data Reports",style: TextStyle(fontSize: 20),),
          ),
          CardsContainer(
            paddings: EdgeInsets.all(8),
            margins: EdgeInsets.symmetric(horizontal: 16),
            childs: Text("${months[tableprovider.date.month-1]} ${tableprovider.date.year}"),cardcolor: Theme.of(context).colorScheme.secondary,),

          Expanded(
            child: Container(
              height: double.infinity,
              margin: const EdgeInsets.only(top:16,bottom: 16,left: 8,right: 16),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(16)
              ),
              child: const TableScreen(),
            ),
          ),
        ],
      ),
    );
  }
}