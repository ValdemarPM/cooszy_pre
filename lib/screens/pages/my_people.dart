import 'package:cooszy_pre/models/level.dart';
import 'package:cooszy_pre/models/level_manager.dart';
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
    "Angeles Rémacha",
    "Dani Casado",
    "Francisco Domingues de Santos e Sousa Batista",
    "Marco Paulo",
    "Paula Soléña",
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

  var levelType = [2, 1, 3, 2, 3, 2, 3, 3];

  LevelManager levelManager = LevelManager();
  Level? level;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    level = levelManager.getLevelByNum(2); // Fetch level by number
  }

  @override
  Widget build(BuildContext context) {
    // Using the null-aware operator `?.` to safely access levelDescription
    String levelDescription = level?.levelDescription ?? "Unknown level";

    return BaseWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My people",
            style: TextStyle(
                fontFamily: 'Baloo2',
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
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
          // FOR LOOP
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
                        // Image
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
                        // Name & level
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Name
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    text: TextSpan(
                                      text: names[i],
                                      style: TextStyle(
                                        fontFamily: 'Kaushan Script',
                                        height: 1.2,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                // Level
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.add_reaction_outlined,
                                      size: 20,
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      levelDescription,
                                      style: const TextStyle(
                                          fontFamily: 'Baloo2', fontSize: 12),
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
                                  Icons.waving_hand,
                                  color: Theme.of(context).colorScheme.primary,
                                ))),
                        // Episode button
                        Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.event_note,
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
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, right: 20.0, bottom: 10.0, left: 20.0),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  side: BorderSide(
                      width: 2, color: Theme.of(context).colorScheme.tertiary)),
              child: const Text("ADD SOMEONE ELSE"),
            ),
          ),
        ]),
      ),
    );
  }
}
