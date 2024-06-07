import 'package:flutter/material.dart';

class CooszySomeoneHeader extends StatelessWidget {
  final String personImage;
  final String levelEmoji;
  final String levelType;
  final String? levelLink;

  const CooszySomeoneHeader(
      {super.key,
      required this.personImage,
      required this.levelEmoji,
      required this.levelType,
      this.levelLink});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0, left: 12.0),
              child: Container(
                // Image outline
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child:
                      // Add image
                      Image.asset(
                    //"assets/images/people/joana.jpg"
                    personImage,
                    height: 70,
                  ),
                ),
              ),
            ),
            // Level
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onInverseSurface,
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(-2, 4))
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Image.asset(
                      // Emoji PNG:
                      //AssetsUtils.emojiLevelAcquaintance,
                      levelEmoji,
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      //"Acquaintance friend",
                      levelType,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Edit level
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.troubleshoot_outlined,
                  //Icons.insert_chart_outlined,
                  size: 24.0,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
