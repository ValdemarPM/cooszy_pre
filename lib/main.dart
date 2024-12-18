import 'package:cooszy_pre/screens/auth/login_screen.dart';
import 'package:cooszy_pre/screens/bases/cooszy_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:cooszy_pre/screens/bases/assets_utils.dart';
import 'package:cooszy_pre/themes/theme_provider.dart';
import 'package:cooszy_pre/screens/pages/calendar.dart';
import 'package:cooszy_pre/screens/pages/groups.dart';
import 'package:cooszy_pre/screens/pages/icebreakers.dart';
import 'package:cooszy_pre/screens/pages/me.dart';
import 'package:cooszy_pre/screens/pages/my_people.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('✅ Firebase has been initialized successfully');
  } catch (e) {
    print('❌ Error initializing Firebase: $e');
  }

  // Initialize date formatting
  await initializeDateFormatting();

  // Run app only once
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
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
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasData) {
                return const HomeScreen();
              }

              return const LoginScreen();
            })

        //const HomeScreen(),
        );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const Icebreakers(),
    const MyPeople(),
    const Groups(),
    const Calendar(),
    const Me(),
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: CooszyNavBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

Future<void> _precacheAssets(BuildContext context) async {
  // ignore: use_build_context_synchronously
  await AssetsUtils.imagePrecache(context);
}
