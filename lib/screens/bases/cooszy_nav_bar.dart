import 'package:flutter/material.dart';

class CooszyNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const CooszyNavBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 60, // Adjusted height
        child: NavigationBar(
          onDestinationSelected: onDestinationSelected,
          selectedIndex: selectedIndex,
          indicatorColor: Theme.of(context).colorScheme.onTertiaryContainer,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: [
            _buildNavigationDestination(
                context, Icons.auto_fix_high, 'Icebreakers', 0),
            _buildNavigationDestination(context, Icons.groups, 'My People', 1),
            _buildNavigationDestination(context, Icons.grain, 'Groups', 2),
            _buildNavigationDestination(
                context, Icons.date_range, 'Calendar', 3),
            _buildNavigationDestination(
                context, Icons.face_retouching_natural, 'Me', 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationDestination(
      BuildContext context, IconData icon, String label, int index) {
    final isSelected = selectedIndex == index;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final unselectedColor = Theme.of(context).colorScheme.inversePrimary;

    return NavigationDestination(
      icon: SizedBox(
        height: 90, // Increased height to accommodate label
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(icon, color: isSelected ? primaryColor : unselectedColor),
            const SizedBox(height: 0),
            AnimatedOpacity(
              opacity: isSelected ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Text(
                label,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      label: label,
    );
  }
}
