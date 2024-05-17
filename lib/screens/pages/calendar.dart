import 'package:cooszy_pre/screens/bases/base_widget.dart';
import 'package:cooszy_pre/themes/cooszy_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  // Initialize the date var
  String _formattedDateTime = '';

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('es_ES', null).then((_) {
      _formatDateTime();
      setState(() {}); // Trigger a rebuild after updating _formattedDateTime
    }).catchError((error) {
      _formattedDateTime = 'Failed to initialize date formatting: $error';
      // Handle initialization failure here
    });
  }

  void _formatDateTime() {
    final dateTime = DateTime(2022, 04, 12, 22, 15);
    final formatter = DateFormat('dd MMM yyyy - HH:mm', 'es_ES');
    _formattedDateTime = formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Scaffold(
        backgroundColor:
            Colors.transparent, // Ensure Scaffold background is transparent
        appBar: AppBar(
          title: const Text("Calendar"),
        ),
        body: Column(
          children: [
            Center(
                child: Icon(
              CooszyIcons.to_do_add,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            )
                //Text("Calendar"),
                ),
            Center(
              child: Text(_formattedDateTime),
            ),
          ],
        ),
      ),
    );
  }
}
