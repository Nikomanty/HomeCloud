enum DynamicEventType {
  uncategorized,
  epiphanyDay,
  easter,
  mayday,
  midsummer,
  christmas,
  newYear,
  seasonalTimeTurn,
}

class DynamicEvent {
  final DateTime dateTime;
  final String title;
  final DynamicEventType dynamicEventType;
  final bool isFlagDay;

  DynamicEvent({
    required this.dateTime,
    required this.title,
    this.dynamicEventType = DynamicEventType.uncategorized,
    this.isFlagDay = false,
  });
}
