import 'package:cooszy_pre/screens/bases/base_widget.dart';
import 'package:flutter/material.dart';

class Groups extends StatefulWidget {
  const Groups({super.key});

  @override
  _GroupsState createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Groups"),
        ),
        body: Container(
          child: const Center(
            child: Text("Groups"),
          ),
        ),
      ),
    );
  }
}
