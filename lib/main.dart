import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riversenseweb/configurations/themes/darkthemes.dart';
import 'package:riversenseweb/configurations/themes/lighttheme.dart';
import 'package:riversenseweb/graphfeatures/provider/graphprovider.dart';
import 'package:riversenseweb/riversdata/pages/riverdatascreen.dart';
import 'package:riversenseweb/riversdata/provider/riverdataprovider.dart';
import 'package:riversenseweb/riversdata/provider/selectionprovider.dart';

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
        ChangeNotifierProvider(create: (c)=>SelectionProvider()),
        
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme:lighttheme ,
        darkTheme: darktheme,
        themeMode: ThemeMode.system,
        home: const RiverDataScreen(),
      ),
    );
  }
}