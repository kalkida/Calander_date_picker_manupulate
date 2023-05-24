abstract class CalendarState {}

class CalendarInitialState extends CalendarState {}

class CalendarValueUpdatedState extends CalendarState {
  final List<DateTime?> values;

  CalendarValueUpdatedState(this.values);
}

class CalendarDisplayedMonthUpdatedState extends CalendarState {
  final DateTime month;

  CalendarDisplayedMonthUpdatedState(this.month);
}
