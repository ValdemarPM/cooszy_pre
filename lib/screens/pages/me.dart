import 'package:cooszy_pre/screens/bases/base_widget.dart';
import 'package:cooszy_pre/screens/components/box.dart';
import 'package:cooszy_pre/screens/components/square_button.dart';
import 'package:cooszy_pre/themes/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Me extends StatefulWidget {
  const Me({super.key});

  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<Me> {
  void _openSettingsBottomSheet(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context, listen: false)
        .isDarkMode; // Capture the state before showModalBottomSheet

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 600,
          child: Center(
            child: CupertinoSwitch(
              value: isDarkMode, // Use the captured value
              onChanged: (value) {
                // Since we're inside the builder, make sure to access provider correctly
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
                Navigator.of(context)
                    .pop(); // Optionally close the bottom sheet after changing the theme
              },
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
          backgroundColor: Theme.of(context).colorScheme.background,
          actions: [
            PopupMenuButton<int>(
              onSelected: (value) {
                if (value == 1) {
                  _openSettingsBottomSheet(context);
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 1,
                  child: Text("Settings"),
                )
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            Center(
              child: Box(
                color: Theme.of(context).colorScheme.primary,
                child: SquareButton(
                  color: Theme.of(context).colorScheme.secondary,
                  onTap: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  },
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
