import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_recruitment_test/features/month_calendar/models/month_engine_data.dart';

part 'month_data.freezed.dart';

@freezed
abstract class MonthData with _$MonthData {
  factory MonthData({
    @Default({}) CellInfoMapper month,
    required DateTime selectedPeriod,
  }) = _MonthData;
}
