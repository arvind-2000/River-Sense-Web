import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riversenseweb/configurations/themes/darkthemes.dart';
import 'package:riversenseweb/configurations/themes/lighttheme.dart';
import 'package:riversenseweb/graphfeatures/provider/graphprovider.dart';
import 'package:riversenseweb/riversdata/pages/riverdatascreen.dart';
import 'package:riversenseweb/riversdata/pages/riverdetailsscreen.dart';
import 'package:riversenseweb/riversdata/provider/riverdataprovider.dart';
import 'package:riversenseweb/riversdata/provider/selectionprovider.dart';

import 'tablefeatures/provider/tableprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c)=>RiverDataProvider()),
        ChangeNotifierProvider(create: (c)=>GraphProvider()),
        ChangeNotifierProvider(create: (c)=>TableProvider()),
        ChangeNotifierProvider(create: (c)=>SelectionProvider()),
        
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'River Sense',
        theme:lighttheme ,
        darkTheme: darktheme,
        themeMode: ThemeMode.dark,
        home: const RiverDataScreen(),
        
        routes: {
          RiverDetailScreen.routename:(context) => const RiverDetailScreen()
        },
      ), 
    );
  }
}
