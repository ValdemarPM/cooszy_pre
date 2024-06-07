import 'package:cooszy_pre/screens/components/cooszy_title.dart';
import 'package:cooszy_pre/screens/subelements/todos_edit.dart';
import 'package:cooszy_pre/screens/subelements/todos_list.dart';
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

  ToDosList toDosList = const ToDosList();

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
          // List of To-Dos
          SingleChildScrollView(
            child: toDosList,
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
