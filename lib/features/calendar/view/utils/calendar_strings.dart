/// All strings used in Home Cloud Calendar
class CalendarStrings {
  static const String calendarViewName = "Kalenteri ja tapahtumat";

  static const String eventCreateMustHaveTitle = "Otsikko puuttuu.";
  static const String eventCreateMustHaveDate = "Päivämäärä puuttuu.";
  static const String ownerHintText = "Kenen tapahtuma?";
  static const String titleHintText = "Otsikko";
  static const String descriptionHintText = "Lisätieto";
  static const String timeHintText = "Aika";
  static const String dateHintText = "Päivämäärä";
  static const String newEventCreated = "Uusi tapahtuma luotu!";

  static String eventEdited(String event) => "Tapahtumaa -$event- muokattu";

  static const String resetTodayButtonTitle = "Tämä päivä";
  static const String selectDateButtonTitle = "Valitse päivä";
  static const String createNewEventButtonTitle = "Uusi tapahtuma";

  static const String selectedDayCalendarEvents = "Valitun päivän tapahtumat";
  static const String noEventsString = "Ei tapahtumia.";

  static String getMoreEventString(int extraEvent) {
    return extraEvent > 1
        ? "$extraEvent muuta tapahtumaa"
        : "$extraEvent muu tapahtuma";
  }
}
