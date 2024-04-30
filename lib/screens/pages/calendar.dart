import 'package:cooszy_pre/screens/bases/base_widget.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
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
        body: const Center(
          child: Text("Calendar"),
        ),
      ),
    );
  }
}
