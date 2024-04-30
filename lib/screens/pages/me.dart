import 'package:cooszy_pre/screens/bases/base_widget.dart';
import 'package:cooszy_pre/screens/components/box.dart';
import 'package:cooszy_pre/screens/components/square_button.dart';
import 'package:cooszy_pre/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Me extends StatefulWidget {
  const Me({super.key});

  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      // Wrap your screen content with BaseWidget
      child: Scaffold(
        backgroundColor:
            Colors.transparent, // Ensure Scaffold background is transparent
        appBar: AppBar(
          title: const Text("Me..."),
        ),
        body: Center(
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
      ),
    );
  }
}
