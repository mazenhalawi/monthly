import 'package:mobile_recruitment_test/features/month_calendar/models/month_engine_data.dart';

extension CellInfoMapperExt on CellInfoMapper {
  List<MonthCellInfo> toMonthCellInfoList() {
    return values.expand((dayColumnMap) => dayColumnMap.values).toList();
  }
}
