part of 'calendar_cubit.dart';

enum CalendarStatus { initial, update, loaded, error }

class CalendarState extends Equatable {
  final CalendarStatus status;
  final List<CalendarEventModel>? calendarData;
  final Exception? exception;

  const CalendarState({
    this.status = CalendarStatus.initial,
    this.calendarData,
    this.exception,
  });

  CalendarState copyWith({
    CalendarStatus? status,
    List<CalendarEventModel>? calendarData,
    Exception? exception,
  }) {
    return CalendarState(
      status: status ?? this.status,
      calendarData: calendarData ?? this.calendarData,
      exception: exception ?? exception,
    );
  }

  @override
  List<Object?> get props => [status, calendarData, exception];
}
