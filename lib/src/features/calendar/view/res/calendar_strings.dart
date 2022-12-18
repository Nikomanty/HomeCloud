/// All strings used in Home Cloud application
class CalendarStrings {
  static const String calendarDbCollection = "calendar-events";

  static const String calendarViewName = "Kalenteri ja tapahtumat";
  static const String todoViewName = "ToDo";

  static const String eventString = "tapahtuma";
  static const String allCalendarEvents = "Kaikki tapahtumat";
  static const String todayCalendarEvents = "Tapahtumat tänään";
  static const String selectedDayCalendarEvents = "Valitun päivän tapahtumat";
  static const String createNewEventButtonTitle = "Uusi tapahtuma";

  static const String eventCreateMustHaveTitle = "Otsikko puuttuu.";
  static const String eventCreateMustHaveDate = "Päivämäärä puuttuu.";
  static const String eventCreatePickTimeHint = "Valitse aika";
  static const String eventCreatePickDateHint = "Valitse päivä";
  static const String ownerHintText = "Omistaja";
  static const String titleHintText = "Otsikko";
  static const String colorHintText = "Väri";
  static const String descriptionHintText = "Lisätieto";
  static const String dateHintText = "Päivämäärä";
  static const String timeHintText = "Aika";
  static const String newEventCreated = "Uusi tapahtuma luotu!";

  static String eventEdited(String event) => "Tapahtumaa -$event- muokattu";

  static const String createNewEventDialogTitle = "Luo uusi tapahtuma";
  static const String confirmCreate = "Luo";
  static const String cancelString = "Peruuta";
  static const String confirmPickString = "Valitse";

  static const String itemDeletionQuestion = "Poistaanko:";
  static const String confirmItemDeletion = "Poista";
  static const String confirmItemEdition = "Vahvista muutokset";

  static const String resetTodayButton = "Tämä päivä";
  static const String selectDateButton = "Valitse päivä";

  static const String noEventsString = "Ei tapahtumia.";

  static String getMoreEventString(int extraEvent) {
    return extraEvent > 1
        ? "$extraEvent muuta tapahtumaa"
        : "$extraEvent muu tapahtuma";
  }
}