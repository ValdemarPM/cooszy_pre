import 'package:cooszy_pre/screens/bases/base_widget.dart';
import 'package:cooszy_pre/screens/pages/my_people.dart';
import 'package:flutter/material.dart';

class Someone extends StatefulWidget {
  const Someone({super.key});

  @override
  _SomeoneState createState() => _SomeoneState();
}

class _SomeoneState extends State<Someone> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      // Wrap your screen content with BaseWidget
      child: Scaffold(
        backgroundColor:
            Colors.transparent, // Ensure Scaffold background is transparent

        appBar: AppBar(
          title: const Text("Someones' name"),
        ),
        body: ElevatedButton(
          child: const Text("Back"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyPeople()));
          },
        ),
      ),
    );
  }
}
