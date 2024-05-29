import 'package:cooszy_pre/screens/components/checkbox_cooszy.dart';
import 'package:cooszy_pre/screens/components/cooszy_title.dart';
import 'package:cooszy_pre/screens/subpages/todos_edit.dart';
import 'package:cooszy_pre/themes/cooszy_icons.dart';
import 'package:flutter/material.dart';

class ToDos extends StatefulWidget {
  const ToDos({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ToDosState createState() => _ToDosState();
}

class _ToDosState extends State<ToDos> {
  static const mainTitle = CooszyTitle(
    textStandard: "To-Dos with ",
    textStyled: "Joana",
    wrapNeeded: false,
  );

  final List<CheckboxCooszy> _checkboxItem1 = [
    const CheckboxCooszy(
      text: "We have to go and drink some beers 🍻 and have lots fo fun.",
      description:
          "But we also have to do some other stuff like we're so fucking crazy and have lots of fun together!",
      date: "15 May 2024 - 10:00",
      alarm: true,
    ),
  ];

  final List<CheckboxCooszy> _checkboxItem2 = [
    const CheckboxCooszy(
      text: "Go to a museum",
      description: "Do not forget to tell our friends to go out.",
      date: "20 May 2024 - 18:00",
      alarm: false,
    ),
  ];

  final toDosEdit = const ToDosEdit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        title: mainTitle,
        titleSpacing: 0,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3.0),
                      child: Icon(
                        Icons.history,
                        size: 22,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    Text(
                      "History",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
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
                          child:
                              Text("Tips for you to take into consideration."),
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
            ),
          ),
          // Action button
          Positioned(
            bottom: 60,
            left: 0,
            right: 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton.extended(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return toDosEdit;
                        });
                  },
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  backgroundColor:
                      Theme.of(context).colorScheme.onTertiaryContainer,
                  label: const Text("Add"),
                  icon: const Icon(CooszyIcons.to_do_add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


  /*
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.onPrimaryContainer),
        title: mainTitle,
        titleSpacing: 0,
        // three dots menu
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Text("History"),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // Combine both lists and map them to widgets
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
              ..._checkboxItem1.map((checkboxItem) {
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
              ..._checkboxItem1.map((checkboxItem) {
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return toDosEdit;
                        });
                  },
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  backgroundColor:
                      Theme.of(context).colorScheme.onTertiaryContainer,
                  label: const Text("Add"),
                  icon: const Icon(CooszyIcons.to_do_add),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
*/
