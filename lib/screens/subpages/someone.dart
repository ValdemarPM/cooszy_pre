import 'package:cooszy_pre/screens/bases/base_widget.dart';
import 'package:flutter/material.dart';

class Someone extends StatefulWidget {
  const Someone({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SomeoneState createState() => _SomeoneState();
}

class _SomeoneState extends State<Someone> {
  bool firstValue = false;
  bool secondValue = false;

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Scaffold(
        backgroundColor:
            Colors.transparent, // Ensure Scaffold background is transparent
        appBar: AppBar(
          title: const Text("Someone's name"),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  // Ensuring the Card has bounded constraints by wrapping it with Expanded
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.asset(
                                  "assets/images/people/angeles.jpg",
                                  height: 100,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Text(
                                    "Angeles Rodrigo Remacha",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      const Icon(
                                        Icons.add_reaction_outlined,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      const Text(
                                        "Intimate friend",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        onPressed:
                                            () {}, // Placeholder empty function
                                        icon: Icon(
                                          Icons.mode_edit,
                                          size: 20.0,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  // Similarly, wrap this Card with Expanded
                  child: Card(
                    child: Column(
                      children: [
                        // Title
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: Icon(Icons.front_hand_outlined,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                              Text(
                                "TO-DOs",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.tertiary),
                                child: const Text("+ TO-DO"),
                              ),
                            ],
                          ),
                        ),
                        // First TO-DO
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: firstValue,
                                  side: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                      width: 1.5),
                                  onChanged: (bool? value) {
                                    if (value != null) {
                                      setState(() {
                                        firstValue = value;
                                      });
                                    }
                                  },
                                ),
                                const Expanded(
                                  child: Text(
                                    "Let's go out and do something this weekend.",
                                  ),
                                ),
                              ],
                            )),
                        // TO-DO Date
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 22.0, bottom: 12.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.event_outlined,
                                size: 20.0,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 14.0),
                                child: Text(
                                  "Saturday, 25 May 2024",
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {}, // Placeholder empty function
                                icon: Icon(
                                  Icons.mode_edit,
                                  size: 20.0,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              )
                            ],
                          ),
                        ),
                        // Second TO-DO
                        Divider(
                          color: Theme.of(context).colorScheme.secondary,
                          indent: 20,
                          endIndent: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            children: [
                              Checkbox(
                                value: secondValue,
                                side: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    width: 1.5),
                                onChanged: (bool? value) {
                                  if (value != null) {
                                    setState(() {
                                      secondValue = value;
                                    });
                                  }
                                },
                              ),
                              Expanded(
                                child: Text(
                                  "Last time we were talking about our trip to Islandia.",
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // TO-DO date
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 22.0, bottom: 12.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.event_outlined,
                                size: 20.0,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 14.0),
                                child: Text(
                                  "Sunday, 26 May 2024",
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {}, // Placeholder empty function
                                icon: Icon(
                                  Icons.mode_edit,
                                  size: 20.0,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              )
                            ],
                          ),
                        ),
                        // See more
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 22.0, bottom: 12.0),
                          child: Column(
                            children: [
                              Row(children: [
                                Expanded(
                                  child: Center(
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down)),
                                  ),
                                )
                              ]),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  // Similarly, wrap this Card with Expanded
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: Icon(Icons.person_pin_outlined,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                              Text(
                                "PROFILE",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text(
                                "PROFILE",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
