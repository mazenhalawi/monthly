import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_recruitment_test/core/errors/failure.dart';
import 'package:mobile_recruitment_test/core/services/month_engine.dart';
import 'package:mobile_recruitment_test/core/utils/time_utils.dart';
import 'package:mobile_recruitment_test/features/month_calendar/models/month_data.dart';

part 'month_event.dart';
part 'month_state.dart';
part 'month_bloc.freezed.dart';

class MonthBloc extends Bloc<MonthEvent, MonthState> {
  final MonthEngine engine;

  MonthBloc({required this.engine})
    : super(
        MonthState.initial(data: MonthData(selectedPeriod: DateTime.now())),
      ) {
    on<MonthEvent>((event, emit) async {
      await event.when(
        getMonthCalendar: () => _mapGetMonthCalendarEventToState(event, emit),
        gotoNextMonth: () => _mapGotoNextMonthEventToState(event, emit),
        gotoPreviousMonth: () => _mapGotoPreviousMonthEventToState(event, emit),
        setDate:
            (_) => _mapSetDateEventToState(event as MonthEventSetDate, emit),
      );
    });
  }
}

extension MapEventToStates on MonthBloc {
  Future<void> _mapSetDateEventToState(
    MonthEventSetDate event,
    Emitter<MonthState> emit,
  ) async {
    emit(state.copyWith(data: state.data.copyWith(selectedPeriod: event.date)));
  }

  Future<void> _mapGotoPreviousMonthEventToState(
    MonthEvent event,
    Emitter<MonthState> emit,
  ) async {
    emit(MonthState.loading(data: state.data));

    final previousMonth = TimeUtils.getPreviousMonth(
      currentMonth: state.data.selectedPeriod.month,
    );
    final previousMonthYear = TimeUtils.getPreviousMonthYear(
      currentMonth: state.data.selectedPeriod.month,
      currentYear: state.data.selectedPeriod.year,
    );
    final previousMonthDate = DateTime(previousMonthYear, previousMonth);

    final monthData = engine.getMonthCalendar(previousMonthDate);

    emit(
      MonthState.loadSuccess(
        data: state.data.copyWith(
          month: monthData,
          selectedPeriod: previousMonthDate,
        ),
      ),
    );
  }

  Future<void> _mapGotoNextMonthEventToState(
    MonthEvent event,
    Emitter<MonthState> emit,
  ) async {
    emit(MonthState.loading(data: state.data));

    final nextMonth = TimeUtils.getNextMonth(
      currentMonth: state.data.selectedPeriod.month,
    );

    final nextMonthYear = TimeUtils.getNextMonthYear(
      currentMonth: state.data.selectedPeriod.month,
      currentYear: state.data.selectedPeriod.year,
    );

    final nextMonthDate = DateTime(nextMonthYear, nextMonth);

    final monthData = engine.getMonthCalendar(nextMonthDate);

    emit(
      MonthState.loadSuccess(
        data: state.data.copyWith(
          month: monthData,
          selectedPeriod: nextMonthDate,
        ),
      ),
    );
  }

  Future<void> _mapGetMonthCalendarEventToState(
    MonthEvent event,
    Emitter<MonthState> emit,
  ) async {
    emit(MonthState.loading(data: state.data));

    final monthData = engine.getMonthCalendar(state.data.selectedPeriod);

    emit(MonthState.loadSuccess(data: state.data.copyWith(month: monthData)));
  }
}
