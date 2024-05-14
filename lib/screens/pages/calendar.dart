import 'package:cooszy_pre/screens/bases/assets_utils.dart';
import 'package:cooszy_pre/screens/bases/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:flutter_svg/svg.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final String emojiIntimateIcon = AssetsUtils.emojiIntimate;
  final String emojiCloseIcon = AssetsUtils.emojiClose;
  Widget svgIntimate = Container();
  Widget svgClose = Container();

  @override
  void initState() {
    super.initState();
    svgIntimate = SvgPicture.asset(
      emojiIntimateIcon,
      semanticsLabel: "Intimate",
      width: 40,
      height: 40,
    );
    svgClose = SvgPicture.asset(
      emojiCloseIcon,
      semanticsLabel: "Close",
      width: 40,
      height: 40,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      // Wrap your screen content with BaseWidget
      child: Scaffold(
        backgroundColor:
            Colors.transparent, // Ensure Scaffold background is transparent
        appBar: AppBar(
          title: const Text("Calendar"),
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(-1, 4))
              ], borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: svgClose, // Use the svg here
            ),
            Center(
              child: svgIntimate, // Use the svg here
            ),
            Center(
                child: Image.asset(
              AssetsUtils.emojiLevelNasty,
              width: 40,
              height: 40,
            )),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(-1, 4))
              ], borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Image.asset(
                AssetsUtils.emojiLevelCasual,
                width: 40,
                height: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
