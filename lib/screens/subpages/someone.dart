import 'package:cooszy_pre/screens/bases/base_widget.dart';
import 'package:cooszy_pre/screens/subpages/episodes.dart';
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
    Episodes episodes = const Episodes();

    return BaseWidget(
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            iconTheme: IconThemeData(
                color: Theme.of(context).colorScheme.inversePrimary),
            title: RichText(
                text: TextSpan(
              text: "Angeles Remacha Rodrigo",
              style: TextStyle(
                  fontFamily: 'Kaushan Script',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary),
            )),
            titleSpacing: 0,
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    // Image header
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset(
                              "assets/images/people/joana.jpg",
                              height: 80,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
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
                                    onPressed: () {},
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
                    // Episodes Tile
                    ExpansionTile(
                      title: Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 6.0),
                          child: Icon(
                            Icons.event_note_outlined,
                            size: 22,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        Text(
                          'Episodes',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        )
                      ]),
                      subtitle: Text(
                        'Your adventures together',
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      children: <Widget>[
                        ListTile(
                            title: Text(
                          'Episodes section',
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        )),
                        episodes,
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
