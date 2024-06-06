import 'package:cooszy_pre/screens/components/cooszy_checkbox.dart';
import 'package:flutter/material.dart';

class ToDosList extends StatefulWidget {
  const ToDosList({super.key});

  @override
  State<ToDosList> createState() => _ToDosListState();
}

class _ToDosListState extends State<ToDosList> {
  final List<CooszyCheckbox> _checkboxItem1 = [
    const CooszyCheckbox(
      text: "We have to go and drink some beers 🍻 and have lots fo fun.",
      description:
          "But we also have to do some other stuff like we're so fucking crazy and have lots of fun together!",
      date: "15 May 2024 - 10:00",
      alarm: true,
    ),
  ];

  final List<CooszyCheckbox> _checkboxItem2 = [
    const CooszyCheckbox(
      text: "Go to a museum",
      description: "Do not forget to tell our friends to go out.",
      date: "20 May 2024 - 18:00",
      alarm: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Card
        Padding(
          padding: const EdgeInsets.only(
              top: 6.0, right: 18.0, bottom: 6.0, left: 18.0),
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            //color: Color.fromARGB(255, 255, 250, 230),
            color: Theme.of(context).colorScheme.onTertiaryContainer,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text("Tips for you to take into consideration."),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            ..._checkboxItem1.map((checkboxItem) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[
                    Expanded(child: checkboxItem),
                  ],
                ),
              );
            }),
            ..._checkboxItem2.map((checkboxItem) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, right: 12.0, bottom: 12.0, left: 12.0),
                child: Row(
                  children: <Widget>[
                    Expanded(child: checkboxItem),
                  ],
                ),
              );
            }),
          ],
        ),
        const SizedBox(
            height:
                80), // Add some space at the bottom for the FloatingActionButton
      ],
    );
  }
}
