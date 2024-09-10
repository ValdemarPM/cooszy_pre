import 'package:cooszy_pre/screens/components/cooszy_title.dart';
import 'package:cooszy_pre/themes/cooszy_icons.dart';
import 'package:flutter/material.dart';

class ToDosEdit extends StatefulWidget {
  const ToDosEdit({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ToDosEditState createState() => _ToDosEditState();
}

class _ToDosEditState extends State<ToDosEdit> {
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialization if needed
  }

  @override
  Widget build(BuildContext context) {
    const editTitle = CooszyTitle(
      textStandard: "To-Do something with ",
      textStyled: "Joana",
      wrapNeeded: true,
    );

    // Date picker controller
    Future<void> selectDate() async {
      DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100));
      if (picked != null) {
        setState(() {
          _dateController.text = picked.toString().split(" ")[0];
        });
      }
    }

    // Notification reminder:
    final List<String> reminderTimes = [
      'On time',
      '5 minutes before...',
      '1 hour before...',
      '1 day before...'
    ];
    String? selectedReminderTime;

    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    editTitle,
                    //const Spacer(),
                    IconButton(
                      icon: Icon(Icons.check,
                          color: Theme.of(context).colorScheme.primary),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        decoration: InputDecoration(
                          // Title textField Icon
                          icon: Icon(CooszyIcons.to_do,
                              color: Theme.of(context).colorScheme.secondary),
                          // TextField underline border
                          enabledBorder: UnderlineInputBorder(
                              // TextField initial underline
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onInverseSurface,
                                  width: 1)),
                          // TextField underline border
                          border: UnderlineInputBorder(
                            // TextField generic underline
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 1),
                          ),
                          // TextField underline border
                          focusedBorder: UnderlineInputBorder(
                            // TextField onFocus underline
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1),
                          ),
                          labelText: 'What are you thinking of doing?',
                          // TextField initial text
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onInverseSurface),
                          // TextField onFocus text
                          floatingLabelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ),
                    Icon(
                      Icons.mic_none_outlined,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      // Pick a date
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: TextField(
                          controller: _dateController,
                          decoration: InputDecoration(
                            hintText: "Pick a date",
                            filled: true,
                            fillColor: Theme.of(context)
                                .colorScheme
                                .onTertiaryContainer,
                            prefixIcon: Icon(
                              Icons.calendar_month_outlined,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                            enabledBorder: UnderlineInputBorder(
                                // TextField initial underline
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onInverseSurface,
                                    width: 1)),
                            // TextField underline border
                            border: UnderlineInputBorder(
                              // TextField generic underline
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  width: 1),
                            ),
                            // TextField underline border
                            focusedBorder: UnderlineInputBorder(
                              // TextField onFocus underline
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1),
                            ),
                          ),
                          readOnly: true,
                          onTap: selectDate,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_on_rounded,
                        ),
                        label: const Text(
                          'Reminder on',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 300,
                        child: DropdownButton<String>(
                          value: selectedReminderTime ?? reminderTimes[0],
                          items: reminderTimes
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedReminderTime = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }
}
