import 'package:cooszy_pre/screens/pages/calendar.dart';
import 'package:cooszy_pre/screens/pages/groups.dart';
import 'package:cooszy_pre/screens/pages/icebreakers.dart';
import 'package:cooszy_pre/screens/pages/me.dart';
import 'package:cooszy_pre/screens/pages/my_people.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class PersistenBottomNavBarDemo extends StatelessWidget {
  const PersistenBottomNavBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: const Icebreakers(),
          item: ItemConfig(
            icon: const Icon(Icons.auto_fix_high),
            title: "Icebreakers",
          ),
        ),
        PersistentTabConfig(
          screen: const MyPeople(),
          item: ItemConfig(
            icon: const Icon(Icons.groups),
            title: "My People",
          ),
        ),
        PersistentTabConfig(
          screen: const Groups(),
          item: ItemConfig(
            icon: const Icon(Icons.grain),
            title: "Groups",
          ),
        ),
        PersistentTabConfig(
          screen: const Calendar(),
          item: ItemConfig(
            icon: const Icon(Icons.date_range),
            title: "Calendar",
          ),
        ),
        PersistentTabConfig(
          screen: const Me(),
          item: ItemConfig(
            icon: const Icon(Icons.face_retouching_natural),
            title: "Me",
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style9BottomNavBar(
        navBarConfig: navBarConfig,
      ),
    ));
  }
}
