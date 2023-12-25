import 'package:flutter/material.dart';
import 'package:home_cloud/features/calendar/models/calendar_event.dart';
import 'package:home_cloud/features/calendar/models/dynamic_event.dart';
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

  static List<DynamicEvent> allFlagAndHolidays(int currentYear) {
    return concurrentFlagDayAndHolidays(currentYear) +
        changingFlagAndHolidays();
  }

  static List<DynamicEvent> concurrentFlagDayAndHolidays(int currentYear) {
    return [
      DynamicEvent(
        dateTime: DateTime.utc(currentYear, 2, 5),
        title: "Runebergin päivä",
        isFlagDay: true,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(currentYear, 2, 28),
        title: "Kalevalan päivä",
        isFlagDay: true,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(currentYear, 3, 19),
        title: "Minna Canthin päivä",
        isFlagDay: true,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(currentYear, 4, 9),
        title: "Mikael Agricolan päivä",
        isFlagDay: true,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(currentYear, 4, 27),
        title: "Kansallinen veteraanipäivä",
        isFlagDay: true,
      ),
      DynamicEvent(
          dateTime: DateTime.utc(2024, 4, 30),
          title: "Vappuaatto",
          dynamicEventType: DynamicEventType.mayday),
      DynamicEvent(
        dateTime: DateTime.utc(currentYear, 5, 1),
        title: "Vappupäivä",
        isFlagDay: true,
        dynamicEventType: DynamicEventType.mayday,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(currentYear, 5, 9),
        title: "Eurooppa-päivä",
        isFlagDay: true,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(currentYear, 5, 12),
        title: "J. V. Snellmanin päivä",
        isFlagDay: true,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(currentYear, 6, 4),
        title: "Puolustusvoimain lippujuhlan päivä",
        isFlagDay: true,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(currentYear, 7, 6),
        title: "Eino Leinon päivä",
        isFlagDay: true,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(currentYear, 10, 1),
        title: "Miina Sillanpään ja kansalaisvaikuttamisen päivä",
        isFlagDay: true,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(currentYear, 10, 10),
        title: "Aleksis Kiven päivä",
        isFlagDay: true,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(currentYear, 10, 24),
        title: "Yhdistyneiden Kansakuntien päivä",
        isFlagDay: true,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(currentYear, 11, 6),
        title: "Ruotsalaisuuden päivä",
        isFlagDay: true,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(currentYear, 11, 20),
        title: "Lapsen oikeuksien päivä",
        isFlagDay: true,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(currentYear, 12, 6),
        title: "Itsenäisyyspäivä",
        isFlagDay: true,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(currentYear, 12, 8),
        title: "Jean Sibeliuksen päivä",
        isFlagDay: true,
      ),
      DynamicEvent(
          dateTime: DateTime.utc(currentYear, 12, 24),
          title: "Jouluaatto",
          dynamicEventType: DynamicEventType.christmas),
      DynamicEvent(
        dateTime: DateTime.utc(currentYear, 12, 25),
        title: "Joulupäivä",
        dynamicEventType: DynamicEventType.christmas,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(currentYear, 12, 26),
        title: "Tapaninpäivä",
        dynamicEventType: DynamicEventType.christmas,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(currentYear, 12, 31),
        title: "Uudenvuodenaatto",
        dynamicEventType: DynamicEventType.newYear,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(currentYear, 1, 1),
        title: "Uudenvuodenpäivä",
        dynamicEventType: DynamicEventType.newYear,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(currentYear, 1, 6),
        title: "Loppiainen",
        dynamicEventType: DynamicEventType.epiphanyDay,
      ),
    ];
  }

  static List<DynamicEvent> changingFlagAndHolidays() {
    return [
      DynamicEvent(
        dateTime: DateTime.utc(2024, 3, 29),
        title: "Pitkäperjantai",
        dynamicEventType: DynamicEventType.easter,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(2024, 3, 30),
        title: "Pääsiäislauantai",
        dynamicEventType: DynamicEventType.easter,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(2024, 3, 31),
        title: "Pääsiäispäivä",
        dynamicEventType: DynamicEventType.easter,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(2024, 4, 1),
        title: "Toinen pääsiäispäivä",
        dynamicEventType: DynamicEventType.easter,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(2024, 5, 9),
        title: "Helatorstai",
      ),
      DynamicEvent(
        dateTime: DateTime.utc(2024, 5, 12),
        title: "Äitienpäivä",
        isFlagDay: true,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(2024, 5, 19),
        title: "Kaatuneitten muistopäivä\nHelluntai",
        isFlagDay: true,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(2024, 6, 21),
        title: "Juhannusaatto",
        dynamicEventType: DynamicEventType.midsummer,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(2024, 6, 22),
        title: "Juhannuspäivä",
        isFlagDay: true,
        dynamicEventType: DynamicEventType.midsummer,
      ),
      DynamicEvent(
        dateTime: DateTime.utc(2024, 11, 2),
        title: "Pyhäinpäivä",
      ),
      DynamicEvent(
        dateTime: DateTime.utc(2024, 11, 10),
        title: "Isänpäivä",
        isFlagDay: true,
      ),
    ];
  }

  static List<DynamicEvent> getSeasonalTimeTurnDays() {
    return [
      DynamicEvent(
          dateTime: DateTime.utc(2024, 3, 30),
          title: "Kesäaika",
          dynamicEventType: DynamicEventType.seasonalTimeTurn),
      DynamicEvent(
          dateTime: DateTime.utc(2024, 10, 26),
          title: "Talviaika",
          dynamicEventType: DynamicEventType.seasonalTimeTurn),
    ];
  }

  static Widget getHolidayIconByType(
      DynamicEventType holidayType, bool isFlagDay) {
    String path = "";

    if (isFlagDay) {
      path = "assets/finnish_flag.png";
    } else {
      switch (holidayType) {
        case DynamicEventType.uncategorized:
        case DynamicEventType.epiphanyDay:
          path = "assets/uncategorized_holiday.png";
          break;
        case DynamicEventType.easter:
          path = "assets/easter_eggs.png";
          break;
        case DynamicEventType.mayday:
          path = "assets/mayday.png";
          break;
        case DynamicEventType.midsummer:
          path = "assets/midsummer.png";
          break;
        case DynamicEventType.christmas:
          path = "assets/christmas_tree.png";
          break;
        case DynamicEventType.newYear:
          path = "assets/firework.png";
          break;
        case DynamicEventType.seasonalTimeTurn:
          path = "assets/time_turning.png";
          break;
      }
    }

    return Image.asset(
      path,
      scale: 5.5,
    );
  }
}
