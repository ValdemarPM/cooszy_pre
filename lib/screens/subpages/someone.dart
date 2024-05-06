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
          title: const Text("Angeles Remacha Rodrigo"),
        ),
        body: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  // Ensuring the Card has bounded constraints by wrapping it with Expanded
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  "assets/images/people/angeles.jpg",
                                  height: 100,
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
            // TO-DOs
            Row(
              children: [
                Expanded(
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
                        // See more Icon button
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
            // Episode
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                // Title
                                Padding(
                                  padding: const EdgeInsets.only(right: 4.0),
                                  child: Icon(Icons.movie_outlined,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary),
                                ),
                                Text(
                                  "EPISODES",
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
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .tertiary),
                                  child: const Text("+ Episode"),
                                ),
                              ],
                            ),
                          ),
                          // One Episode - title
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, right: 10.0, bottom: 5.0, left: 10.0),
                            child: Row(
                              children: [
                                Icon(Icons.sentiment_dissatisfied,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Text(
                                    "Salida a cenar",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // One Episode - date
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 0, right: 10.0, bottom: 5.0, left: 10.0),
                            child: Row(
                              children: [
                                Text(
                                  "25 April 2024",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // One Episode - text
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, right: 10.0, bottom: 5.0, left: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    '''Esa noche, teníamos planes de ir a cenar juntos. Habíamos estado hablando de ello durante toda la semana, emocionados por pasar un rato agradable y disfrutar de una buena comida. Imaginábamos el ambiente acogedor del restaurante, las risas compartidas y los deliciosos platillos que probaríamos.''',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 6,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.navigate_next,
                                    size: 26,
                                  ),
                                )
                              ],
                            ),
                          ),
                          // Another Episode - title
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, right: 10.0, bottom: 5.0, left: 10.0),
                            child: Row(
                              children: [
                                Icon(Icons.sentiment_satisfied,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Text(
                                    "Una hora de llamada",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Another Episode - date
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 0, right: 10.0, bottom: 5.0, left: 10.0),
                            child: Row(
                              children: [
                                Text(
                                  "24 April 2024",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Another Episode - text
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, right: 10.0, bottom: 5.0, left: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    '''Hemos estado habkando de reprogramar una velada. Aquí un resumen de cómo lo hicimos: Elegir una nueva fecha. 
Lo primero que hicimos fue buscar una nueva fecha que funcionara para ambos. Revisamos nuestras agendas y encontramos un día en la siguiente semana que encajaba perfectamente.Reservar en el restaurante. Una vez teníamos la fecha, procedimos a llamar al restaurante favorito y hacer la reserva. Nos aseguramos de solicitar una mesa tranquila y agradable.''',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 6,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.navigate_next,
                                    size: 26,
                                  ),
                                )
                              ],
                            ),
                          ),
                          // See more Icon button
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
                ),
              ],
            ),
            // Profile
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                // Title
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
                          ),
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                ),
                                Text(
                                  "Angeles Remacha Rodrigo",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                ),
                                Text(
                                  "25 May 1965",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Avinguda de Les Cortes Catalanas, n. 233 08220 Sant Andrà del Besòs - Barcelona - Espanya.",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
