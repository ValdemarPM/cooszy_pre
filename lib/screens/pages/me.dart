import 'package:cooszy_pre/screens/bases/assets_utils.dart';
import 'package:cooszy_pre/screens/bases/base_widget.dart';
import 'package:cooszy_pre/screens/components/cooszy_expansion_tile.dart';
import 'package:cooszy_pre/screens/components/cooszy_someone_header.dart';
import 'package:cooszy_pre/screens/subelements/someone_profile.dart';
import 'package:cooszy_pre/screens/subpages/episodes.dart';
import 'package:cooszy_pre/themes/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cooszy_pre/services/auth_service.dart'; // Add this import

class Me extends StatefulWidget {
  const Me({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MeState createState() => _MeState();
}

class _MeState extends State<Me> {
  bool firstValue = false;
  bool secondValue = false;

  // Header
  CooszySomeoneHeader header = const CooszySomeoneHeader(
      personImage: "assets/images/people/francisco.jpg",
      levelEmoji: AssetsUtils.emojiLevelAcquaintance,
      levelType: "Acquaintance friend");

  // Episodes Tile
  Episodes episodes = const Episodes();
  late CooszyExpansionTile episodesTile = CooszyExpansionTile(
    titleIcon: Icons.event_note_outlined,
    titleText: 'My Episodes',
    subtitleText: 'Last episode - 25 April 2024',
    child: episodes,
  );

  // Profile & Profile Tile
  SomeOneProfile profile = const SomeOneProfile();
  late CooszyExpansionTile profileTile = CooszyExpansionTile(
    titleIcon: Icons.person_pin_outlined,
    titleText: 'My Profile',
    subtitleText: 'My personal details',
    child: profile,
  );

  void _openSettingsBottomSheet(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context, listen: false)
        .isDarkMode; // Capture the state before showModalBottomSheet

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 600,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("Switch Light/Dark modes "),
                      CupertinoSwitch(
                        value: isDarkMode, // Use the captured value
                        onChanged: (value) {
                          // Since we're inside the builder, make sure to access provider correctly
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme();
                          Navigator.of(context)
                              .pop(); // Optionally close the bottom sheet after changing the theme
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "Add something"),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      // Wrap your screen content with BaseWidget
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Me"),
          backgroundColor: Theme.of(context).colorScheme.surface,
          actions: [
            PopupMenuButton<int>(
              onSelected: (value) async {
                // Made async to handle logout
                if (value == 1) {
                  _openSettingsBottomSheet(context);
                } else if (value == 2) {
                  // Show confirmation dialog before logout
                  bool confirm = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Logout'),
                            content:
                                const Text('Are you sure you want to logout?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ) ??
                      false;

                  if (confirm && mounted) {
                    try {
                      final authService = AuthService();
                      await authService.signOut();
                      // No need to navigate - main.dart's StreamBuilder will handle it
                    } catch (e) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error logging out: $e')),
                        );
                      }
                    }
                  }
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width: 8),
                      Text("Settings"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Logout",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Image header
              header,
              // Episodes Tile
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: episodesTile,
              ),
              // Profile tile
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: profileTile,
              ),
              const SizedBox(
                height: 90,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
