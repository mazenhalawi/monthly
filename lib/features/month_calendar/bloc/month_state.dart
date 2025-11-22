part of 'month_bloc.dart';

@freezed
abstract class MonthState with _$MonthState {
  const factory MonthState.initial({
    required MonthData data,
    @Default(false) bool isListenerState,
  }) = MonthStateInitial;

  const factory MonthState.loading({
    required MonthData data,
    @Default(false) bool isListenerState,
  }) = MonthStateLoading;

  const factory MonthState.loadFailure({
    required Failure failure,
    required MonthEvent retryEvent,
    required MonthData data,
    @Default(false) bool isListenerState,
  }) = MonthStateLoadFailure;

  const factory MonthState.loadSuccess({
    required MonthData data,
    @Default(false) bool isListenerState,
  }) = MonthStateLoadSuccess;

  const factory MonthState.displayAlert({
    required String title,
    required String message,
    required MonthData data,
    @Default(false) bool shouldPopOut,
    @Default(true) bool isListenerState,
  }) = MonthStateDisplayAlert;
}
