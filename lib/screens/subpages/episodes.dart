import 'package:flutter/material.dart';

class Episodes extends StatefulWidget {
  const Episodes({super.key});

  @override
  State<Episodes> createState() => _EpisodesState();
}

class _EpisodesState extends State<Episodes> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    child: Icon(Icons.event_note_outlined,
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  Text(
                    "EPISODES",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.tertiary),
                    child: const Text("+ Episode"),
                  ),
                ],
              ),
            ),

            // One Episode - title
            /*
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, right: 10.0, bottom: 5.0, left: 10.0),
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
                  top: 0, right: 10.0, bottom: 5.0, left: 10.0),
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
                        color: Theme.of(context).colorScheme.inversePrimary,
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
                  top: 0, right: 10.0, bottom: 5.0, left: 10.0),
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
                        color: Theme.of(context).colorScheme.inversePrimary,
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
              padding: const EdgeInsets.only(left: 22.0, bottom: 12.0),
              child: Column(
                children: [
                  Row(children: [
                    Expanded(
                      child: Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.keyboard_arrow_down)),
                      ),
                    )
                  ]),
                ],
              ),
            )
            */
          ],
        ),
      ),
    );
  }
}
