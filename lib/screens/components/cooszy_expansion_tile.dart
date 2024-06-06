import 'package:flutter/material.dart';

class CooszyExpansionTile extends StatefulWidget {
  final IconData titleIcon;
  final String titleText;
  final String subtitleText;
  final Widget child;

  const CooszyExpansionTile({
    super.key,
    required this.titleIcon,
    required this.titleText,
    required this.subtitleText,
    required this.child,
  });

  @override
  State<CooszyExpansionTile> createState() => _CooszyExpansionTileState();
}

class _CooszyExpansionTileState extends State<CooszyExpansionTile> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      trailing: Icon(
        _customTileExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
        size: 28,
      ),
      iconColor: Theme.of(context).colorScheme.primary,
      collapsedIconColor: Theme.of(context).colorScheme.onPrimaryContainer,
      onExpansionChanged: (bool expanded) {
        setState(() {
          _customTileExpanded = expanded;
        });
      },
      title: Row(children: [
        Padding(
          padding: const EdgeInsets.only(right: 6.0),
          child: Icon(
            // Tilte icon
            widget.titleIcon,
            //Icons.event_note_outlined,
            size: 22,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        Text(
          // Title text
          widget.titleText,
          //'Episodes',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).colorScheme.inversePrimary),
        )
      ]),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: 3.0),
        child: Text(
          // Subtitle text
          widget.subtitleText,
          //'Last episode - 25 April 2024',
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
      ),
      // Episodes content
      children: [
        //ListTile(title: Text('Your adventures together',style: TextStyle(color:Theme.of(context).colorScheme.inversePrimary),)),
        // Wdget content
        widget.child,
      ],
    );
  }
}
