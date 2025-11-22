part of 'month_bloc.dart';

@freezed
class MonthEvent with _$MonthEvent {
  const factory MonthEvent.started() = _Started;
}