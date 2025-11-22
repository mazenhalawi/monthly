import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_recruitment_test/core/errors/failure.dart';
import 'package:mobile_recruitment_test/core/services/month_engine.dart';
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
      await event.when(getMonth: () => _mapGetMonthEventToState(event, emit));
    });
  }
}

extension MapEventToStates on MonthBloc {
  Future<void> _mapGetMonthEventToState(
    MonthEvent event,
    Emitter<MonthState> emit,
  ) async {
    emit(MonthState.loading(data: state.data));

    final monthData = engine.getMonth(state.data.selectedPeriod);

    emit(MonthState.loadSuccess(data: state.data.copyWith(month: monthData)));
  }
}
