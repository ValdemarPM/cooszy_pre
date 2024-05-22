import 'package:cooszy_pre/helpers/date_formatter.dart';
import 'package:cooszy_pre/screens/bases/assets_utils.dart';
import 'package:cooszy_pre/screens/bases/base_widget.dart';
import 'package:cooszy_pre/screens/subpages/someone.dart';
import 'package:cooszy_pre/screens/subpages/todos.dart';
import 'package:cooszy_pre/themes/cooszy_icons.dart';
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

  // Dates
  List<String> _formattedDateTimes = [];
  final List<String> lastTime = [
    "2024, 12, 04",
    "2024, 08, 22",
    "2024, 05, 15",
    "2024, 09, 15",
    "2024, 10, 22",
    "2023, 12, 18",
    "2023, 04, 09",
    "2024, 04, 04"
  ];

  // Initiate the Date states
  @override
  void initState() {
    super.initState();
    _loadFormattedDateTimes();
  }

  // Dates conformation
  Future<void> _loadFormattedDateTimes() async {
    List<String> formattedDateTimes = [];
    // parsing the list of Strings to Dates
    for (String time in lastTime) {
      List<int> dateParts = time.split(', ').map(int.parse).toList();
      DateTime dateTime = DateTime(
        dateParts[0],
        dateParts[1],
        dateParts[2],
      );
      // Format the Dates
      String formattedDateTime =
          await DateFormatter.formatDate(dateTime, 'es_ES');
      formattedDateTimes.add(formattedDateTime);
    }
    setState(() {
      _formattedDateTimes = formattedDateTimes;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Date icon
    List<Icon> dateType = [
      Icon(
        Icons.notifications_active,
        size: 16,
        color: Theme.of(context).colorScheme.secondary,
      ),
      Icon(
        Icons.notifications_active,
        size: 16,
        color: Theme.of(context).colorScheme.secondary,
      ),
      Icon(
        Icons.alarm_on_outlined,
        size: 16,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      Icon(
        Icons.alarm_on_outlined,
        size: 16,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      Icon(
        Icons.history,
        size: 16,
        color: Theme.of(context).colorScheme.secondary,
      ),
      Icon(
        Icons.history,
        size: 16,
        color: Theme.of(context).colorScheme.secondary,
      ),
      Icon(
        Icons.history,
        size: 16,
        color: Theme.of(context).colorScheme.secondary,
      ),
      Icon(
        Icons.history,
        size: 16,
        color: Theme.of(context).colorScheme.secondary,
      ),
    ];

    return BaseWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My people",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
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
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ],
        ),
        body: ListView(children: [
          // FOR LOOP
          for (int i = 0; i < _formattedDateTimes.length; i++)
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
                                      top: 4.0, right: 14.0),
                                  child: Container(
                                    // Image oultine
                                    padding: const EdgeInsets.all(3),
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
                                        height: 50,
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
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ]),
                        ),
                        // Name & Date
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 6.0),
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
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Icon - Date history

                                    dateType[i],
                                    //Icons.schedule_outlined,
                                    //Icons.notifications_active_outlined,
                                    //Icons.alarm_on_outlined,
                                    //Icons.history,

                                    const SizedBox(
                                      width: 6,
                                    ),
                                    // Data text
                                    Text(
                                      _formattedDateTimes[i],
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
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const ToDos()));
                                },
                                icon: Icon(
                                  CooszyIcons.to_do,
                                  color: Theme.of(context).colorScheme.primary,
                                ))),
                        // Episode button
                        Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.event_note_outlined,
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
