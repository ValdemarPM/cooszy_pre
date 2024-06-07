import 'package:flutter/material.dart';

class Episodes extends StatefulWidget {
  const Episodes({super.key});

  @override
  State<Episodes> createState() => _EpisodesState();
}

class _EpisodesState extends State<Episodes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: [
          // One Episode - title
          Padding(
            padding: const EdgeInsets.only(
                top: 6.0, right: 12.0, bottom: 6.0, left: 12.0),
            child: Row(
              children: [
                Icon(Icons.sentiment_dissatisfied,
                    color: Theme.of(context).colorScheme.inversePrimary),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Text(
                    "Salida a cenar",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // One Episode - date
          Padding(
            padding: const EdgeInsets.only(
                top: 0, right: 12.0, bottom: 6.0, left: 12.0),
            child: Row(
              children: [
                Text(
                  "25 April 2024",
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          // One Episode - text
          Padding(
            padding: const EdgeInsets.only(
                top: 6.0, right: 12.0, bottom: 6.0, left: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    '''Esa noche, teníamos planes de ir a cenar juntos. Habíamos estado hablando de ello durante toda la semana, emocionados por pasar un rato agradable y disfrutar de una buena comida. Imaginábamos el ambiente acogedor del restaurante, las risas compartidas y los deliciosos platillos que probaríamos.''',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.navigate_next,
                    size: 22,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                )
              ],
            ),
          ),
          // Another Episode - title
          Padding(
            padding: const EdgeInsets.only(
                top: 12.0, right: 12.0, bottom: 6.0, left: 12.0),
            child: Row(
              children: [
                Icon(Icons.sentiment_satisfied,
                    color: Theme.of(context).colorScheme.inversePrimary),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Text(
                    "Una hora de llamada",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Another Episode - date
          Padding(
            padding: const EdgeInsets.only(
                top: 0, right: 12.0, bottom: 5.0, left: 12.0),
            child: Row(
              children: [
                Text(
                  "24 April 2024",
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          // Another Episode - text
          Padding(
            padding: const EdgeInsets.only(
                top: 6.0, right: 12.0, bottom: 6.0, left: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    '''Hemos estado habkando de reprogramar una velada. Aquí un resumen de cómo lo hicimos: Elegir una nueva fecha. 
Lo primero que hicimos fue buscar una nueva fecha que funcionara para ambos. Revisamos nuestras agendas y encontramos un día en la siguiente semana que encajaba perfectamente.Reservar en el restaurante. Una vez teníamos la fecha, procedimos a llamar al restaurante favorito y hacer la reserva. Nos aseguramos de solicitar una mesa tranquila y agradable.''',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.navigate_next,
                    size: 22,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                )
              ],
            ),
          ),
          // See more Icon button
          Padding(
            padding: const EdgeInsets.only(left: 24.0, bottom: 12.0),
            child: Column(
              children: [
                Row(children: [
                  Expanded(
                    child: Center(
                        child: TextButton.icon(
                            onPressed: () {},
                            icon: Column(
                              children: [
                                Text(
                                  'More episodes...',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                ),
                              ],
                            ),
                            label: const Text(''))

                        /*
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.keyboard_arrow_down)),
                          */
                        ),
                  )
                ]),
              ],
            ),
          ),

          FloatingActionButton.extended(
            onPressed: () {},
            foregroundColor: Theme.of(context).colorScheme.primary,
            backgroundColor: Theme.of(context).colorScheme.onTertiaryContainer,
            label: const Text("New"),
            icon: const Icon(Icons.event_note_outlined),
          ),

          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
