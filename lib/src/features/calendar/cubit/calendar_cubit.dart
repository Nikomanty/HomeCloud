import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_cloud/src/features/calendar/data/calendar_repository_impl.dart';
import 'package:home_cloud/src/features/calendar/models/calendar_event_model.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  final CalendarRepository _calendarRepository;

  CalendarCubit(this._calendarRepository) : super(const CalendarState());

  Future<void> deleteData(String documentID) async {
    try {
      _calendarRepository.deleteData(documentID);
      updateData();
    } on Exception {
      return;
    }
  }

  Future<void> createData(
    String? documentID,
    Map<String, dynamic> newDocumentObject,
  ) async {
    try {
      _calendarRepository.createData(documentID, newDocumentObject);
      updateData();
    } on Exception {
      return;
    }
  }

  Future<void> updateData() async {
    emit(state.copyWith(status: CalendarStatus.update));
    getData();
  }

  Future<void> getData() async {
    try {
      List<CalendarEventModel> data = await _calendarRepository.fetchData();
      emit(state.copyWith(status: CalendarStatus.loaded, calendarData: data));
    } on Exception catch (exception) {
      emit(state.copyWith(status: CalendarStatus.error, exception: exception));
    }
  }
}
