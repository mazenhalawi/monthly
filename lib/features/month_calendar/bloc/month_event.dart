part of 'month_bloc.dart';

@freezed
class MonthEvent with _$MonthEvent {
  const factory MonthEvent.getMonthCalendar() = MonthEventGetMonthCalendar;

  const factory MonthEvent.gotoNextMonth() = MonthEventGetNextMonthCalendar;

  const factory MonthEvent.gotoPreviousMonth() =
      MonthEventGetPreviousMonthCalendar;

  const factory MonthEvent.setDate(DateTime date) = MonthEventSetDate;
}
