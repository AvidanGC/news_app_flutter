import 'package:intl/intl.dart';

class TimeHelper {

  static getDateTime(DateTime? date) {
    return date == null ? "..." : DateFormat('dd MMM yy HH:mm').format(date);
  }

 static String getDateTimeString(String? date) {
    if (date == null) {
      return "...";
    }
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('dd MMMM yy HH:mm').format(dateTime);
  }
}