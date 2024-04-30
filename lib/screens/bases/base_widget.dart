import 'package:flutter/material.dart';

class BaseWidget extends StatelessWidget {
  final Widget child;
  const BaseWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black12,
      /*
        image: DecorationImage(
          image: AssetImage("assets/images/milky-way_light.jpg"), // Your background image
          fit: BoxFit.cover, // Ensures the image covers the full container
        ),
      */
      ),
      child: child, // Your screen's unique content will be passed here
    );
  }
}