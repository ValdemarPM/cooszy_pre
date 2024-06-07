import 'package:table_calendar/table_calendar.dart';

class LocalizeCalendarTable {
  final Map<String, Map<CalendarFormat, String>> localizedCalendarFormat = {
    'en_EN': {
      CalendarFormat.month: 'Month',
      CalendarFormat.twoWeeks: '2 weeks',
      CalendarFormat.week: 'Week',
    },
    'es_ES': {
      CalendarFormat.month: 'Mes',
      CalendarFormat.twoWeeks: '2 semanas',
      CalendarFormat.week: 'Semana',
    },
  };
}
