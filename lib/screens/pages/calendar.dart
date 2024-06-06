import 'package:cooszy_pre/helpers/calendar_table_event.dart';
import 'package:cooszy_pre/themes/cooszy_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cooszy_pre/helpers/localize_calendar_table.dart';

// Ensure you have the necessary import for the localization class
LocalizeCalendarTable _localizeCalendarTable = LocalizeCalendarTable();

String getLocalizedCalendarFormat(BuildContext context, CalendarFormat format) {
  String locale = Localizations.localeOf(context).toString();
  return _localizeCalendarTable.localizedCalendarFormat[locale]?[format] ??
      _localizeCalendarTable.localizedCalendarFormat['es_ES']![format]!;
}

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
  List<Event>? eventsList;
  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Retreive all events of the selected day
    return events[day] ?? [];
  }

  @override
  void dispose() {
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

  void _onFormatChange(format) {
    if (_calendarFormat != format) {
      setState(() {
        _calendarFormat = format;
      });
    }
  }

  void _onPageChange(focusedDay) {
    _focusedDay = focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      // Add event button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  scrollable: true,
                  title: const Text("Event name"),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _eventController,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          // Save events into Map

                          if (events[_selectedDay] != null) {
                            eventsList = events[_selectedDay]!;
                            events.addAll({
                              _selectedDay!: [
                                ...eventsList!,
                                ...[Event(_eventController.text)]
                              ],
                            });
                          } else {
                            events.addAll({
                              _selectedDay!: [Event(_eventController.text)],
                            });
                          }
                          _eventController.text = "";

                          Navigator.of(context).pop();
                          _selectedEvents.value =
                              _getEventsForDay(_selectedDay!);
                        },
                        child: const Text("Submit"))
                  ],
                );
              });
        },
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onTertiaryContainer,
        label: const Text("Add"),
        icon: const Icon(CooszyIcons.to_do_add),
      ),
      // Calendar block
      body: Padding(
        padding:
            const EdgeInsets.only(top: 0, right: 12.0, bottom: 0, left: 12.0),
        child: Column(
          children: [
            // Switch view mode button
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Positioned(
                top: 6,
                right: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // Removing the shadow
                    elevation: 0,
                    padding: const EdgeInsets.only(
                        top: 6.0, right: 12.0, bottom: 6.0, left: 12.0),
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .onTertiaryContainer, // Use backgroundColor instead of primary
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    side: BorderSide(
                        width: 1,
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
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
            ),
            // Calendar
            Padding(
              padding: const EdgeInsets.only(
                  top: 0, right: 12.0, bottom: 0, left: 12.0),
              child: TableCalendar(
                // Locale for calendar:
                locale: 'es_ES',
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                startingDayOfWeek: StartingDayOfWeek.monday,
                onDaySelected: _onDaySelected,
                eventLoader: _getEventsForDay,
                selectedDayPredicate: _onSelectedDayPredicate,
                onFormatChanged: _onFormatChange,
                onPageChanged: _onPageChange,
                // Styling header:
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false, // Hide the default format button
                  titleCentered: true,
                  leftChevronVisible: true,
                  rightChevronVisible: true,
                ),
                calendarStyle: CalendarStyle(
                  // Active selection days
                  selectedDecoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  // Today
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
            ),
            const SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: _selectedEvents,
                  builder: (context, value, _) {
                    return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: ListTile(
                            //onTap: () => print("${value[index]}"),
                            title: Text('${value[index]}'),
                          ),
                        );
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
