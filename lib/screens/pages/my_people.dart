import 'package:cooszy_pre/helpers/date_formatter.dart';
import 'package:cooszy_pre/screens/bases/base_widget.dart';
import 'package:cooszy_pre/screens/subpages/someone.dart';
import 'package:cooszy_pre/screens/subpages/todos.dart';
import 'package:cooszy_pre/services/firebase_service.dart';
import 'package:cooszy_pre/themes/cooszy_icons.dart';
import 'package:cooszy_pre/widgets/person_form_dialog.dart';
import 'package:flutter/material.dart';
import 'package:cooszy_pre/models/person.dart';

class MyPeople extends StatefulWidget {
  const MyPeople({super.key});

  @override
  MyPeopleState createState() => MyPeopleState();
}

class MyPeopleState extends State<MyPeople> {
  final FirebaseService _firebaseService = FirebaseService();
  List<Person> _people = [];
  bool _isLoading = true;
  List<String> _formattedDateTimes = [];

  @override
  void initState() {
    super.initState();
    _loadPeople();
  }

  Future<void> _loadPeople() async {
    setState(() => _isLoading = true);
    try {
      // Listen to the stream of people
      _firebaseService.getPeopleStream().listen((people) {
        setState(() {
          _people = people;
          _loadFormattedDateTimes();
        });
      });
    } catch (e) {
      print('Error loading people: $e');
    }
    setState(() => _isLoading = false);
  }

  Future<void> _loadFormattedDateTimes() async {
    List<String> formattedDateTimes = [];
    for (var person in _people) {
      String formattedDateTime =
          await DateFormatter.formatDate(person.lastInteraction, 'es_ES');
      formattedDateTimes.add(formattedDateTime);
    }
    setState(() {
      _formattedDateTimes = formattedDateTimes;
    });
  }

  Icon _getIconFromDateType(DateType dateType, BuildContext context) {
    switch (dateType) {
      case DateType.notifications:
        return Icon(
          Icons.notifications_active,
          size: 16,
          color: Theme.of(context).colorScheme.secondary,
        );
      case DateType.alarm:
        return Icon(
          Icons.alarm_on_outlined,
          size: 16,
          color: Theme.of(context).colorScheme.inversePrimary,
        );
      case DateType.history:
        return Icon(
          Icons.history,
          size: 16,
          color: Theme.of(context).colorScheme.secondary,
        );
    }
  }

  Future<void> _addPerson() async {
    final person = await showDialog<Person>(
      context: context,
      builder: (context) => const PersonFormDialog(),
    );

    if (person != null) {
      try {
        print("Attempting to add person: ${person.name}");
        await FirebaseService().addPerson(person);
        print("Person added successfully!");

        // Refresh the list
        await _loadPeople();
      } catch (e) {
        print('Error adding person: $e');
        // Show error to user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error adding person: $e')),
        );
      }
    }
  }

  Widget _buildAddPersonButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        right: 20.0,
        bottom: 10.0,
        left: 20.0,
      ),
      child: OutlinedButton(
        onPressed: _addPerson,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        child: const Text("ADD SOMEONE ELSE"),
      ),
    );
  }

  Widget _buildNameAndDate(BuildContext context, Person person, int index) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: RichText(
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                text: TextSpan(
                  text: person.name,
                  style: TextStyle(
                    fontFamily: 'Kaushan Script',
                    height: 1.2,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _getIconFromDateType(person.dateType, context),
                const SizedBox(width: 6),
                Text(
                  _formattedDateTimes[index],
                  style: TextStyle(
                    fontFamily: 'Baloo2',
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ToDos()),
              );
            },
            icon: const Icon(CooszyIcons.to_do),
            label: const Text(''),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.navigate_next,
            size: 26,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildPersonTile(BuildContext context, Person person, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Someone(person: person),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                // Image and level emoji
                _buildProfileImage(person),

                // Name and date
                _buildNameAndDate(context, person, index),

                // Action buttons
                _buildActionButtons(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage(Person person) {
    return Padding(
      padding: const EdgeInsets.only(left: 3.0, top: 3.0),
      child: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 4.0, right: 14.0),
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset(
                  person.imageAsset,
                  height: 50,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(-3, 3),
                )
              ],
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Image.asset(
              person.levelEmoji, // Using the getter from Person model
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return BaseWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My people",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
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
              onSelected: (value) {
                if (value == 1) {
                  _addPerson();
                }
              },
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: _people.length + 1,
          itemBuilder: (context, index) {
            if (index == _people.length) {
              return _buildAddPersonButton(context);
            }

            final person = _people[index];
            return _buildPersonTile(context, person, index);
          },
        ),
      ),
    );
  }
}
