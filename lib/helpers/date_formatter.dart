import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DateFormatter {
  // Date with hour
  static Future<String> formatDateTime(DateTime dateTime, String locale) async {
    try {
      await initializeDateFormatting(locale, null);
      final formatter = DateFormat('dd MMM yyyy - H:mm', locale);
      return formatter.format(dateTime);
    } catch (error) {
      return 'Failed to initialize date formatting: $error';
    }
  }

  // Date without hour
  static Future<String> formatDate(DateTime dateTime, String locale) async {
    try {
      await initializeDateFormatting(locale, null);
      final formatter = DateFormat('dd MMM yyyy', locale);
      return formatter.format(dateTime);
    } catch (error) {
      return 'Failed to initialize date formatting: $error';
    }
  }
}
