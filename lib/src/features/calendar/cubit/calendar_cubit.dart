import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../data/calendar_repository_impl.dart';
import '../models/calendar_event_model.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  final CalendarRepository _calendarRepository;

  CalendarCubit(this._calendarRepository) : super(CalendarInitial());

  Future<void> getData() async {
    try {
      List<CalendarEventModel> data = await _calendarRepository.fetchData();
      emit(CalendarLoaded(calendarData: data));
    } on Exception {
      emit(CalendarError(
        errorMessage: "Couldn't fetch calendar data from firebase",
      ));
    }
  }
}
