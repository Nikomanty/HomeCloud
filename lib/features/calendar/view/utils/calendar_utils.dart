import 'package:flutter/material.dart';
import 'package:home_cloud/features/calendar/models/calendar_event.dart';
import 'package:home_cloud/features/calendar/models/holiday.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarUtils {
  static List<String> eventOwners() {
    return [
      "Niko",
      "Minna",
      "Melina",
      "Rasmus",
      "Yhteinen",
    ];
  }

  static HeaderStyle getCalendarHeaderStyle(BuildContext context) {
    return HeaderStyle(
      titleTextStyle:
          Theme.of(context).textTheme.headlineSmall ?? const TextStyle(),
      titleCentered: true,
      leftChevronIcon: const Icon(Icons.arrow_circle_left_outlined),
      rightChevronIcon: const Icon(Icons.arrow_circle_right_outlined),
      headerPadding: const EdgeInsets.all(0),
      formatButtonVisible: false,
    );
  }

  static List<CalendarEvent> getAllEventsByDate(
      List<CalendarEvent> allEvents, DateTime date) {
    List<CalendarEvent> eventsForGivenDate = [];
    for (var element in allEvents) {
      DateFormat dateFormat = DateFormat('yyyy-MM-dd');
      if (dateFormat.format(element.eventDate) == dateFormat.format(date)) {
        eventsForGivenDate.add(element);
      }
    }
    return eventsForGivenDate;
  }

  static Map<DateTime, String> allNameDays(int currentYear) {
    return {
      DateTime.utc(currentYear, 1, 17): "Toni",
      DateTime.utc(currentYear, 3, 4): "Ari",
      DateTime.utc(currentYear, 5, 2): "Vuokko",
      DateTime.utc(currentYear, 5, 5): "Melina",
      DateTime.utc(currentYear, 5, 21): "Konsta",
      DateTime.utc(currentYear, 5, 26): "Minna",
      DateTime.utc(currentYear, 6, 24): "Juho",
      DateTime.utc(currentYear, 6, 26): "Janne",
      DateTime.utc(currentYear, 6, 29): "Petri",
      DateTime.utc(currentYear, 7, 1): "Aaro",
      DateTime.utc(currentYear, 7, 19): "Sari",
      DateTime.utc(currentYear, 7, 21): "Hanne, Jonna",
      DateTime.utc(currentYear, 7, 25): "Jimi",
      DateTime.utc(currentYear, 8, 11): "Sanna",
      DateTime.utc(currentYear, 9, 14): "Iida",
      DateTime.utc(currentYear, 10, 6): "Pinja",
      DateTime.utc(currentYear, 10, 10): "Aleksi",
      DateTime.utc(currentYear, 10, 24): "Rasmus",
      DateTime.utc(currentYear, 10, 22): "Anita",
      DateTime.utc(currentYear, 12, 6): "Niko",
      DateTime.utc(currentYear, 12, 8): "Kyllikki",
      DateTime.utc(currentYear, 12, 9): "Anne",
      DateTime.utc(currentYear, 12, 11): "Tatu",
      DateTime.utc(currentYear, 12, 27): "Hannu",
    };
  }

  static List<Holiday> allFlagAndHolidays(int currentYear) {
    return concurrentFlagDayAndHolidays(currentYear) +
        changingFlagAndHolidays();
  }

  static List<Holiday> concurrentFlagDayAndHolidays(int currentYear) {
    return [
      Holiday(
        dateTime: DateTime.utc(currentYear, 2, 5),
        title: "Runebergin päivä",
        isFlagDay: true,
      ),
      Holiday(
        dateTime: DateTime.utc(currentYear, 2, 28),
        title: "Kalevalan päivä",
        isFlagDay: true,
      ),
      Holiday(
        dateTime: DateTime.utc(currentYear, 3, 19),
        title: "Minna Canthin päivä",
        isFlagDay: true,
      ),
      Holiday(
        dateTime: DateTime.utc(currentYear, 4, 9),
        title: "Mikael Agricolan päivä",
        isFlagDay: true,
      ),
      Holiday(
        dateTime: DateTime.utc(currentYear, 4, 27),
        title: "Kansallinen veteraanipäivä",
        isFlagDay: true,
      ),
      Holiday(
        dateTime: DateTime.utc(2024, 4, 30),
        title: "Vappuaatto",
        isFlagDay: false,
      ),
      Holiday(
        dateTime: DateTime.utc(currentYear, 5, 1),
        title: "Vappupäivä",
        isFlagDay: true,
      ),
      Holiday(
        dateTime: DateTime.utc(currentYear, 5, 9),
        title: "Eurooppa-päivä",
        isFlagDay: true,
      ),
      Holiday(
        dateTime: DateTime.utc(currentYear, 5, 12),
        title: "J. V. Snellmanin päivä",
        isFlagDay: true,
      ),
      Holiday(
        dateTime: DateTime.utc(currentYear, 6, 4),
        title: "Puolustusvoimain lippujuhlan päivä",
        isFlagDay: true,
      ),
      Holiday(
        dateTime: DateTime.utc(currentYear, 7, 6),
        title: "Eino Leinon päivä",
        isFlagDay: true,
      ),
      Holiday(
        dateTime: DateTime.utc(currentYear, 10, 1),
        title: "Miina Sillanpään ja kansalaisvaikuttamisen päivä",
        isFlagDay: true,
      ),
      Holiday(
        dateTime: DateTime.utc(currentYear, 10, 10),
        title: "Aleksis Kiven päivä",
        isFlagDay: true,
      ),
      Holiday(
        dateTime: DateTime.utc(currentYear, 10, 24),
        title: "Yhdistyneiden Kansakuntien päivä",
        isFlagDay: true,
      ),
      Holiday(
        dateTime: DateTime.utc(currentYear, 11, 6),
        title: "Ruotsalaisuuden päivä",
        isFlagDay: true,
      ),
      Holiday(
        dateTime: DateTime.utc(currentYear, 11, 20),
        title: "Lapsen oikeuksien päivä",
        isFlagDay: true,
      ),
      Holiday(
        dateTime: DateTime.utc(currentYear, 12, 6),
        title: "Itsenäisyyspäivä",
        isFlagDay: true,
      ),
      Holiday(
        dateTime: DateTime.utc(currentYear, 12, 8),
        title: "Jean Sibeliuksen päivä",
        isFlagDay: true,
      ),
      Holiday(
        dateTime: DateTime.utc(currentYear, 12, 24),
        title: "Jouluaatto",
        isFlagDay: false,
      ),
      Holiday(
        dateTime: DateTime.utc(currentYear, 12, 25),
        title: "Joulupäivä",
        isFlagDay: false,
      ),
      Holiday(
        dateTime: DateTime.utc(currentYear, 12, 26),
        title: "Tapaninpäivä",
        isFlagDay: false,
      ),
      Holiday(
        dateTime: DateTime.utc(2024, 12, 31),
        title: "Uudenvuodenaatto",
        isFlagDay: false,
      ),
    ];
  }

  static List<Holiday> changingFlagAndHolidays() {
    return [
      Holiday(
        dateTime: DateTime.utc(2024, 1, 1),
        title: "Uudenvuodenpäivä",
        isFlagDay: false,
      ),
      Holiday(
        dateTime: DateTime.utc(2024, 1, 6),
        title: "Loppiainen",
        isFlagDay: false,
      ),
      Holiday(
        dateTime: DateTime.utc(2024, 3, 29),
        title: "Pitkäperjantai",
        isFlagDay: false,
      ),
      Holiday(
        dateTime: DateTime.utc(2024, 3, 30),
        title: "Pääsiäislauantai",
        isFlagDay: false,
      ),
      Holiday(
        dateTime: DateTime.utc(2024, 3, 31),
        title: "Pääsiäispäivä",
        isFlagDay: false,
      ),
      Holiday(
        dateTime: DateTime.utc(2024, 4, 1),
        title: "Toinen pääsiäispäivä",
        isFlagDay: false,
      ),
      Holiday(
        dateTime: DateTime.utc(2024, 5, 9),
        title: "Helatorstai",
        isFlagDay: false,
      ),
      Holiday(
        dateTime: DateTime.utc(2024, 5, 12),
        title: "Äitienpäivä",
        isFlagDay: true,
      ),
      Holiday(
        dateTime: DateTime.utc(2024, 5, 19),
        title: "Kaatuneitten muistopäivä\nHelluntai",
        isFlagDay: true,
      ),
      Holiday(
        dateTime: DateTime.utc(2024, 6, 21),
        title: "Juhannusaatto",
        isFlagDay: false,
      ),
      Holiday(
        dateTime: DateTime.utc(2024, 6, 22),
        title: "Juhannuspäivä",
        isFlagDay: true,
      ),
      Holiday(
        dateTime: DateTime.utc(2024, 11, 2),
        title: "Pyhäinpäivä",
        isFlagDay: false,
      ),
      Holiday(
        dateTime: DateTime.utc(2024, 11, 10),
        title: "Isänpäivä",
        isFlagDay: true,
      ),
    ];
  }
}
