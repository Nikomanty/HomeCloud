import 'package:intl/intl.dart';

class DateFormatUtils {
  static String formattedDateddMMyyyy (DateTime dateTime) {
    return DateFormat('dd.MM.yyyy').format(dateTime);
  }

  static String formattedDateddMMyyyyHHmm (DateTime dateTime) {
    return DateFormat('dd.MM.yyyy / HH:mm').format(dateTime);
  }

  static String formattedDateddMM(DateTime dateTime) {
    return DateFormat('dd.MM.').format(dateTime);
  }

  static String formattedTimeHHmm (DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  static DateTime getFirstDateOfCalendar() => DateTime.utc(2010, 1, 1);
  static DateTime getLastDateOfCalendar() => DateTime.utc(2040, 31, 12);

}