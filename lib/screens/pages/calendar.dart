import 'package:cooszy_pre/screens/bases/base_widget.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final List<_CheckboxItem> _checkboxItems = [
    const _CheckboxItem(text: "InduceSmile.com"),
    const _CheckboxItem(text: "Flutter.io"),
    const _CheckboxItem(text: "google.com"),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Calendar"),
        ),
        body: Column(
          children: [
            Center(
              child: Column(
                children: _checkboxItems,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CheckboxItem extends StatefulWidget {
  final String text;

  const _CheckboxItem({required this.text});

  @override
  __CheckboxItemState createState() => __CheckboxItemState();
}

class __CheckboxItemState extends State<_CheckboxItem> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                  value: _isChecked,
                  shape: const CircleBorder(),
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      width: 2),
                  onChanged: (val) {
                    setState(() {
                      if (val != null) {
                        _isChecked = val;
                        if (val == true) {}
                      }
                    });
                  }),
            ),
            const Flexible(
              child: Text(
                "We have to drink some beers 🍻",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    height: 0.9, fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        const Row(children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 0.0, right: 18.0, bottom: 6.0, left: 18.0),
              child: Text(
                  "And also do some other stuff like we're so fucking crazy and have lots of fun together! "),
            ),
          )
        ]),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 0.0, right: 6.0, bottom: 18.0, left: 18.0),
              child: Icon(
                Icons.schedule_outlined,
                color: Theme.of(context).colorScheme.secondary,
                size: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0.0, right: 18.0, bottom: 18.0, left: 0.0),
              child: Text(
                "15 Mar 2024 - 10:00",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
            )
          ],
        ),
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          indent: 20,
          endIndent: 20,
        ),
      ],
    );
  }
}
