import 'package:flutter/material.dart';

class ToDos extends StatelessWidget {
  const ToDos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.onPrimaryContainer),
        title: RichText(
            text: TextSpan(
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
                children: const <TextSpan>[
              TextSpan(
                  text: "To-Dos with ",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  )),
              TextSpan(
                  text: "Hermenegildo",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Kaushan Script',
                  ))
            ])),
        titleSpacing: 0,
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your username',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
