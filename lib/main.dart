import 'package:cooszy_pre/screens/bases/persisten_bottom_nav_bar_demo.dart';
import 'package:cooszy_pre/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cooszy',
      theme: Provider.of<ThemeProvider>(context).themeData,
      //theme: ThemeData(useMaterial3: true,),
      home: const PersistenBottomNavBarDemo(),
    );
  }
}
