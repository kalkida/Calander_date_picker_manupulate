abstract class CalendarEvent {}

class CalendarValueChangedEvent extends CalendarEvent {
  final List<DateTime?> values;

  CalendarValueChangedEvent(this.values);
}

class CalendarDisplayedMonthChangedEvent extends CalendarEvent {
  final DateTime month;

  CalendarDisplayedMonthChangedEvent(this.month);
}
