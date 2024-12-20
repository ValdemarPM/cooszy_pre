import 'package:cooszy_pre/models/person.dart';
import 'package:cooszy_pre/screens/bases/assets_utils.dart';
import 'package:cooszy_pre/screens/bases/base_widget.dart';
import 'package:cooszy_pre/screens/components/cooszy_expansion_tile.dart';
import 'package:cooszy_pre/screens/components/cooszy_someone_header.dart';
import 'package:cooszy_pre/screens/subelements/activities_and_hobbies.dart';
import 'package:cooszy_pre/screens/subelements/likes_and_dislikes.dart';
import 'package:cooszy_pre/screens/subelements/special_events.dart';
import 'package:cooszy_pre/screens/subelements/todos_list.dart';
import 'package:cooszy_pre/screens/subpages/episodes.dart';
import 'package:cooszy_pre/screens/subelements/someone_profile.dart';
import 'package:cooszy_pre/themes/cooszy_icons.dart';
import 'package:flutter/material.dart';

class Someone extends StatefulWidget {
  final Person person;

  const Someone({
    super.key,
    required this.person,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SomeoneState createState() => _SomeoneState();
}

class _SomeoneState extends State<Someone> {
  bool firstValue = false;
  bool secondValue = false;

  @override
  Widget build(BuildContext context) {
    // Header
    CooszySomeoneHeader header = const CooszySomeoneHeader(
        personImage: "assets/images/people/joana.jpg",
        levelEmoji: AssetsUtils.emojiLevelAcquaintance,
        levelType: "Acquaintance friend");

    // ToDos Tile
    ToDosList toDosList = const ToDosList();
    CooszyExpansionTile toDosTile;
    toDosTile = CooszyExpansionTile(
      titleIcon: CooszyIcons.to_do,
      titleText: 'To-Dos',
      subtitleText: 'Next meeting - 8 May 2024',
      child: toDosList,
    );

    // Episodes Tile
    Episodes episodes = const Episodes();
    CooszyExpansionTile episodesTile;
    episodesTile = CooszyExpansionTile(
      titleIcon: Icons.event_note_outlined,
      titleText: 'Episodes',
      subtitleText: 'Last episode - 25 April 2024',
      child: episodes,
    );

    // Special Events Tile
    SpecialEents specialEvents = const SpecialEents();
    CooszyExpansionTile specialEventsTile;
    specialEventsTile = CooszyExpansionTile(
      titleIcon: CooszyIcons.special_events,
      //titleIcon: CooszyIcons.activities,
      titleText: 'Special Events',
      subtitleText: 'Important date events for Joana',
      child: specialEvents,
    );

    // Activities & Hobbies Tile
    ActivitiesAndHobbies activitiesAndHobbies = const ActivitiesAndHobbies();
    CooszyExpansionTile activitiesAndHobbiesTile;
    activitiesAndHobbiesTile = CooszyExpansionTile(
      titleIcon: Icons.directions_walk_rounded,
      //titleIcon: CooszyIcons.activities,
      titleText: 'Activities & Hobbies',
      subtitleText: 'Thing Joana enjoys doing',
      child: activitiesAndHobbies,
    );

    // Likes & Dislikes Tile
    LikesAndDislikes likesAndDislikes = const LikesAndDislikes();
    CooszyExpansionTile likesAndDislikesTile;
    likesAndDislikesTile = CooszyExpansionTile(
      titleIcon: Icons.theater_comedy_outlined,
      titleText: 'Likes & Dislikes',
      subtitleText: 'Things Joana likes and thisngs no so much...',
      child: likesAndDislikes,
    );

    // Profile & Profile Tile
    SomeOneProfile profile = const SomeOneProfile();
    CooszyExpansionTile profileTile;
    profileTile = CooszyExpansionTile(
      titleIcon: Icons.person_pin_outlined,
      titleText: 'Profile',
      subtitleText: 'Personal details of Joana María',
      child: profile,
    );

    return BaseWidget(
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            iconTheme: IconThemeData(
                color: Theme.of(context).colorScheme.inversePrimary),
            title: RichText(
                text: TextSpan(
              text: "Joana María",
              style: TextStyle(
                  fontFamily: 'Kaushan Script',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary),
            )),
            titleSpacing: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Image header
                header,
                // Todos Tile
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12.0, right: 12.0, bottom: 6.0, left: 12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: toDosTile,
                  ),
                ),
                // Episodes Tile
                Padding(
                  padding: const EdgeInsets.only(
                      top: 6.0, right: 12.0, bottom: 6.0, left: 12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: episodesTile,
                  ),
                ),
                // Special Events Tile
                Padding(
                  padding: const EdgeInsets.only(
                      top: 6.0, right: 12.0, bottom: 6.0, left: 12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: specialEventsTile,
                  ),
                ),
                // Activities and Hobbies Tile
                Padding(
                  padding: const EdgeInsets.only(
                      top: 6.0, right: 12.0, bottom: 6.0, left: 12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: activitiesAndHobbiesTile,
                  ),
                ),
                // Likes and Dislikes Tile
                Padding(
                  padding: const EdgeInsets.only(
                      top: 6.0, right: 12.0, bottom: 6.0, left: 12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: likesAndDislikesTile,
                  ),
                ),
                // Profile tile
                Padding(
                  padding: const EdgeInsets.only(
                      top: 6.0, right: 12.0, bottom: 6.0, left: 12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: profileTile,
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
              ],
            ),
          )),
    );
  }
}
