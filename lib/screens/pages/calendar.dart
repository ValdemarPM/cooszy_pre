import 'package:cooszy_pre/screens/components/calendar_event_marker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cooszy_pre/helpers/localize_calendar_table.dart';
import 'package:cooszy_pre/helpers/calendar_table_event.dart'; // Import the correct Event class

LocalizeCalendarTable _localizeCalendarTable = LocalizeCalendarTable();

String getLocalizedCalendarFormat(BuildContext context, CalendarFormat format) {
  String locale = Localizations.localeOf(context).toString();
  return _localizeCalendarTable.localizedCalendarFormat[locale]?[format] ??
      _localizeCalendarTable.localizedCalendarFormat['es_ES']![format]!;
}

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  // Events
  Map<DateTime, List<Event>> events = {};
  final TextEditingController _eventController = TextEditingController();
  // List events
  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Retrieve all events of the selected day
    return events[day] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    _selectedEvents.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedEvents.value = _getEventsForDay(selectedDay);
      });
    }
  }

  bool _onSelectedDayPredicate(DateTime day) {
    // Use `selectedDayPredicate` to determine which day is selected
    return isSameDay(_selectedDay, day);
  }

  void _onFormatChange(CalendarFormat format) {
    if (_calendarFormat != format) {
      setState(() {
        _calendarFormat = format;
      });
    }
  }

  void _onPageChange(DateTime focusedDay) {
    _focusedDay = focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            // Important to allow the sheet to resize when the keyboard appears
            isScrollControlled: true,
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(24.0),

                //EdgeInsets.only(
                //bottom: MediaQuery.of(context).viewInsets.bottom),
                child: ListView(shrinkWrap: true, children: [
                  Row(
                    children: <Widget>[
                      const Text("Title"),
                      const Spacer(),
                      IconButton(
                        icon: Icon(Icons.check,
                            color: Theme.of(context).colorScheme.primary),
                        onPressed: () {
                          if (_eventController.text.isEmpty) return;

                          setState(() {
                            if (events[_selectedDay] != null) {
                              events[_selectedDay]!.add(
                                Event(_eventController.text),
                              );
                            } else {
                              events[_selectedDay!] = [
                                Event(_eventController.text)
                              ];
                            }
                            _selectedEvents.value =
                                _getEventsForDay(_selectedDay!);
                          });

                          _eventController.clear();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: _eventController,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "Enter event title"),
                        ),
                      )
                    ],
                  ),
                  const Row(
                    children: <Widget>[
                      SizedBox(height: 16.0),
                    ],
                  ),
                ]),
              );
            },
          );
        },
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onTertiaryContainer,
        label: const Text("Add"),
        icon: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Switch view mode button
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // Removing the shadow
                  elevation: 0,
                  padding: const EdgeInsets.only(
                      top: 6.0, right: 12.0, bottom: 6.0, left: 12.0),
                  backgroundColor:
                      Theme.of(context).colorScheme.onTertiaryContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  side: BorderSide(
                      width: 1,
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
                onPressed: () {
                  setState(() {
                    _calendarFormat = _calendarFormat == CalendarFormat.month
                        ? CalendarFormat.twoWeeks
                        : _calendarFormat == CalendarFormat.twoWeeks
                            ? CalendarFormat.week
                            : CalendarFormat.month;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 6.0),
                      child: Icon(
                        Icons.date_range_rounded,
                        size: 18,
                      ),
                    ),
                    Text(
                      getLocalizedCalendarFormat(context, _calendarFormat),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
              ),
            ),
            TableCalendar(
              locale: 'es_ES',
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              startingDayOfWeek: StartingDayOfWeek.monday,
              selectedDayPredicate: _onSelectedDayPredicate,
              onDaySelected: _onDaySelected,
              onFormatChanged: _onFormatChange,
              onPageChanged: _onPageChange,
              eventLoader: _getEventsForDay,
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, date, events) {
                  if (events.isNotEmpty) {
                    return Positioned(
                      // Position of the Event marker dot
                      bottom: -3,
                      child: EventMarker(date: date, events: events),
                      //_buildEventsMarker(date, events),
                    );
                  }
                  return Container();
                },
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                leftChevronVisible: true,
                rightChevronVisible: true,
              ),
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle,
                ),
                todayTextStyle:
                    TextStyle(color: Theme.of(context).colorScheme.tertiary),
                selectedTextStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Flexible(
              child: ValueListenableBuilder<List<Event>>(
                valueListenable: _selectedEvents,
                builder: (context, value, _) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Container(
                        // Some spacing between tiles
                        margin: const EdgeInsets.symmetric(vertical: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .tertiary, // Set the border color to light gray
                            width: 1.0, // Set the border width
                          ),
                        ),
                        child: ListTile(
                          title: Text(value[index].title),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
