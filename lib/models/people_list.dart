import 'package:flutter/material.dart';

class PeopleList extends StatelessWidget {
  const PeopleList({super.key});

  //final List<PeopleSource> peoples;

  @override
  Widget build(BuildContext context) {
    //const title = 'Mixed List';

    return ListView(children: [
      GestureDetector(
        onTap: () {},
        child: const Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Person name"),
                Text("Level"),
              ],
            ))
          ],
        ),
      ),

      /*ListTile(
        leading: Icon(Icons.map),
        title: Text('Map'),
      ),
      ListTile(
        leading: Icon(Icons.photo_album),
        title: Text('Album'),
      ),
      ListTile(
        leading: Icon(Icons.phone),
        title: Text('Phone'),
      ),*/
    ]);
  }
}

/*
class People {
  final String thumbPath;
  final String name;
  final String level;

  People({required this.thumbPath, required this.name, required this.level});
}
*/