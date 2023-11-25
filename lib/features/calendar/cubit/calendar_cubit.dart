import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_cloud/features/calendar/data/calendar_service.dart';
import 'package:home_cloud/features/calendar/models/calendar_event.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  final CalendarService _calendarService;

  CalendarCubit(this._calendarService) : super(const CalendarState());

  Future<void> deleteData(String documentID) async {
    try {
      await _calendarService.deleteData(documentID);
      await updateData();
    } on Exception {
      return;
    }
  }

  Future<void> createData(
    String? documentID,
    Map<String, dynamic> newDocumentObject,
  ) async {
    try {
      await _calendarService.createData(documentID, newDocumentObject);
      await updateData();
    } on Exception {
      return;
    }
  }

  Future<void> updateData() async {
    emit(state.copyWith(status: CalendarStatus.update));
    await getData();
  }

  Future<void> getData() async {
    try {
      List<CalendarEvent> data = await _calendarService.fetchData();
      emit(state.copyWith(status: CalendarStatus.loaded, calendarData: data));
    } on Exception catch (exception) {
      emit(state.copyWith(status: CalendarStatus.error, exception: exception));
    }
  }
}
