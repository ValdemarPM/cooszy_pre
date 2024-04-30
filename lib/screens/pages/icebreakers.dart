import 'package:cooszy_pre/screens/bases/base_widget.dart';
import 'package:flutter/material.dart';

class Icebreakers extends StatefulWidget {
  const Icebreakers({super.key});

  @override
  State<Icebreakers> createState() => _IcebreakersState();
}

class _IcebreakersState extends State<Icebreakers> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      // Wrap your screen content with BaseWidget
      child: Scaffold(
        backgroundColor:
            Colors.transparent, // Ensure Scaffold background is transparent
        appBar: AppBar(
          title: const Text("Icebreakers"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 600,
                      child: Center(
                        child: ElevatedButton(
                          child: const Text("Close"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    );
                  });
            },
            child: const Text("PopUp"),
          ),
        ),
      ),
    );
  }
}
