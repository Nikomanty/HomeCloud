part of 'calendar_cubit.dart';

@immutable
abstract class CalendarState extends Equatable{
  @override
  List<Object> get props => [];
}

class CalendarInitial extends CalendarState {}

class CalendarLoaded extends CalendarState {
  final List<CalendarEventModel> calendarData;
  CalendarLoaded({required this.calendarData});
}

class CalendarError extends CalendarState {
  final String errorMessage;
  CalendarError({required this.errorMessage});
}
