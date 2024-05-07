import 'package:cooszy_pre/screens/bases/base_widget.dart';
import 'package:cooszy_pre/screens/subpages/someone.dart';
import 'package:flutter/material.dart';

class MyPeople extends StatefulWidget {
  const MyPeople({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyPeopleState createState() => _MyPeopleState();
}

class _MyPeopleState extends State<MyPeople> {
  var names = [
    "Joana Maria",
    "Angeles Remacha",
    "Dani Casado",
    "Francisco Domingues de Santos e Sousa Batista",
    "Marco Paulo",
    "Paula Solé",
    "Bruno Machado da Silva",
    "Cristina Ferrer"
  ];

  var images = [
    "joana",
    "angeles",
    "dani",
    "francisco",
    "marco",
    "paula",
    "bruno",
    "cris"
  ];

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My people"),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 1,
                  child: Text("Add a contact"),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Text("Resync all contacts"),
                ),
              ],
            ),
          ],
        ),
        body: ListView(children: [
          for (int i = 0; i < 8; i++)
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Someone()));
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0, top: 4.0),
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).colorScheme.primary),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                "assets/images/people/${images[i]}.jpg",
                                height: 60,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  // Name
                                  names[i],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary, // Removed const here
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.add_reaction_outlined,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "Intimate friend",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        // To-Do button
                        Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.front_hand,
                                  color: Theme.of(context).colorScheme.primary,
                                ))),
                        // Episode button
                        Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.movie,
                                  color: Theme.of(context).colorScheme.primary,
                                ))),
                        // See details button
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.navigate_next,
                            size: 26,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ]),
      ),
    );
  }
}
