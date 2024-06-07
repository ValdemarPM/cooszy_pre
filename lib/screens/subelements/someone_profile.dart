import 'package:flutter/material.dart';

class SomeOneProfile extends StatefulWidget {
  const SomeOneProfile({super.key});

  @override
  State<SomeOneProfile> createState() => _SomeOneProfileState();
}

class _SomeOneProfileState extends State<SomeOneProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Name
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, right: 10.0, bottom: 5.0, left: 10.0),
            child: Row(
              children: [
                Text(
                  "Name: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                Text(
                  "Joana María",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
          ),
          // Birth date
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, right: 10.0, bottom: 5.0, left: 10.0),
            child: Row(
              children: [
                Text(
                  "Birth date: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                Text(
                  "25 May 1995",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, right: 10.0, bottom: 5.0, left: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Address: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Avinguda de Les Cortes Catalanas, n. 133 08219 Barcelona - Espanya.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
