import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class DateFormatter {
  DateFormatter._();

  static String relative(DateTime date) {
    return timeago.format(date);
  }

  static String fullDate(DateTime date) {
    return DateFormat('MMMM d, yyyy').format(date);
  }

  static String shortDate(DateTime date) {
    return DateFormat('MMM d').format(date);
  }

  static String dayOfWeek(DateTime date) {
    return DateFormat('EEEE').format(date);
  }

  static String newsletterDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateOnly = DateTime(date.year, date.month, date.day);

    if (dateOnly == today) return 'Today';
    if (dateOnly == today.subtract(const Duration(days: 1))) return 'Yesterday';
    return DateFormat('EEE, MMM d').format(date);
  }
}
