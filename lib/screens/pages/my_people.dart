import 'package:cooszy_pre/screens/bases/assets_utils.dart';
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

  List<String> levelType = [
    AssetsUtils.emojiLevelAcquaintance,
    AssetsUtils.emojiLevelIntimate,
    AssetsUtils.emojiLevelCasual,
    AssetsUtils.emojiLevelNasty,
    AssetsUtils.emojiLevelAcquaintance,
    AssetsUtils.emojiLevelIntimate,
    AssetsUtils.emojiLevelClose,
    AssetsUtils.emojiLevelAcquaintance
  ];

  var lastTime = [
    "12 Feb 2024",
    "5 Mar 2024",
    "22 Apr 2024",
    "18 Dec 2023",
    "15 Jan 2024",
    "1 Sep 2023",
    "22 Apr 2024",
    "4 Apr 2024"
  ];

  @override
  Widget build(BuildContext context) {
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
                          padding: const EdgeInsets.only(left: 3.0, top: 3.0),
                          child: Stack(
                              alignment: Alignment.topRight,
                              children: <Widget>[
                                Container(
                                  // Emoji icon position defined by this padding
                                  padding: const EdgeInsets.only(
                                      top: 4.0, right: 15.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    // Image oultine
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    child: ClipRRect(
                                      // Image circle
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Image.asset(
                                        "assets/images/people/${images[i]}.jpg",
                                        height: 60,
                                      ),
                                    ),
                                  ),
                                ),
                                // Level emoji
                                Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onInverseSurface,
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                            offset: const Offset(-3, 3))
                                      ],
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Image.asset(
                                    // Emoji PNG:
                                    levelType[i],
                                    width: 25,
                                    height: 25,
                                  ),
                                ),
                              ]),
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
                                    Icon(
                                      Icons.history,
                                      size: 20,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      lastTime[i],
                                      style: TextStyle(
                                          fontFamily: 'Baloo2',
                                          fontSize: 12,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
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
