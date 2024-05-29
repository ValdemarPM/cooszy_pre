import 'package:flutter/material.dart';

class CheckboxCooszy extends StatefulWidget {
  final String text;
  final String? description; // Make the description parameter nullable
  final String date;
  final bool alarm;

  const CheckboxCooszy(
      {super.key,
      required this.text,
      this.description, // description is optional
      required this.date,
      required this.alarm});

  @override
  // ignore: library_private_types_in_public_api
  __CheckboxCooszyState createState() => __CheckboxCooszyState();
}

class __CheckboxCooszyState extends State<CheckboxCooszy> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            widget.alarm
                // If alarm is true
                ? Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, right: 6.0, bottom: 6.0, left: 16.0),
                    child: Icon(
                      Icons.notifications_active,
                      color: Theme.of(context).colorScheme.primary,
                      size: 18,
                    ),
                  )
                // If alarm is false
                : Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, right: 6.0, bottom: 6.0, left: 16.0),
                    child: Icon(
                      Icons.notifications_off_outlined,
                      color: Theme.of(context).colorScheme.primary,
                      size: 18,
                    ),
                  ),

            // Display date
            Padding(
              padding: const EdgeInsets.only(
                  top: 0.0, right: 18.0, bottom: 6.0, left: 6.0),
              child: Text(
                widget.date,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            const Spacer(),
            // Three dots menu
            PopupMenuButton(
              icon: Icon(Icons.more_vert,
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 3.0),
                        child: Icon(
                          Icons.edit_outlined,
                          size: 22,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      Text(
                        "Edit",
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 3.0),
                        child: Icon(
                          Icons.delete_outline,
                          size: 22,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      Text(
                        "Delete",
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            // Checkbox
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                  value: _isChecked,
                  shape: const CircleBorder(),
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      width: 2),
                  onChanged: (val) {
                    setState(() {
                      if (val != null) {
                        _isChecked = val;
                        if (val == true) {}
                      }
                    });
                  }),
            ),
            // ToDo Title
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: Text(
                  widget.text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      height: 1,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
              ),
            ),
          ],
        ),
        Row(children: [
          // ToDo description
          if (widget.description != null)
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, right: 18.0, bottom: 12.0, left: 48.0),
                child: Text(
                  widget.description!,
                  style: TextStyle(
                      height: 1.2,
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
              ),
            )
        ]),
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          indent: 20,
          endIndent: 20,
        ),
      ],
    );
  }
}
