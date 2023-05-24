import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'calander_class.dart';
import 'calander_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarInitialState()) {
    on<CalendarValueChangedEvent>(
        (event, emit) => emit(CalendarValueUpdatedState(event.values)));

    on<CalendarDisplayedMonthChangedEvent>(
        (event, emit) => emit(CalendarDisplayedMonthUpdatedState(event.month)));
  }

  // @override
  // Stream<CalendarState> mapEventToState(CalendarEvent event) async* {
  //   if (event is CalendarValueChangedEvent) {
  //     yield CalendarValueUpdatedState(event.values);
  //   } else if (event is CalendarDisplayedMonthChangedEvent) {
  //     yield CalendarDisplayedMonthUpdatedState(event.month);
  //   }
  // }
}
