import 'package:cooszy_pre/models/level.dart';
import 'package:cooszy_pre/models/level_manager.dart';
import 'package:cooszy_pre/screens/bases/base_widget.dart';
import 'package:flutter/material.dart';

class Groups extends StatefulWidget {
  const Groups({super.key});

  @override
  _GroupsState createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  LevelManager levelManager = LevelManager();
  Level? level;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    level = levelManager.getLevelByNum(2); // Fetch level by number
  }

  @override
  Widget build(BuildContext context) {
    // Using the null-aware operator `?.` to safely access levelDescription
    String levelDescription = level?.levelDescription ?? "Unknown level";

    return BaseWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Groups"),
        ),
        body: Center(
          child: Text(levelDescription),
        ),
      ),
    );
  }
}
