import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'month_event.dart';
part 'month_state.dart';
part 'month_bloc.freezed.dart';

class MonthBloc extends Bloc<MonthEvent, MonthState> {
  MonthBloc() : super(_Initial());
}
