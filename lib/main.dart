import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:cooszy_pre/screens/bases/assets_utils.dart';
import 'package:cooszy_pre/screens/bases/persisten_bottom_nav_bar_demo.dart';
import 'package:cooszy_pre/themes/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting().then((_) => runApp(ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: const MyApp(),
      )));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _precacheAssets(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cooszy',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const PersistenBottomNavBar(),
    );
  }
}

Future<void> _precacheAssets(BuildContext context) async {
  // ignore: use_build_context_synchronously
  await AssetsUtils.imagePrecache(context);
}
