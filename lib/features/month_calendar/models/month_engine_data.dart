// ignore_for_file: unintended_html_in_doc_comment
import 'package:equatable/equatable.dart';

/// Constants for the month calendar grid dimensions.

class KMonthEngine {
  KMonthEngine._();

  static const columnCount = 7;

  static const rowCount = 6;
}

/// Type definition for the calendar grid structure.
///
/// typedef CellInfoMapper = Map<WeekRow, Map<DayColumn, MonthCellInfo>>;
///
/// A nested map where:
/// - Outer map key: row index (0-5) - Calendar Rows representing weeks
/// - Inner map key: column index (0-6) - Calendar Columns representing weekdays
/// - Value: [MonthCellInfo] containing complete information about that cell
typedef CellInfoMapper = Map<int, Map<int, MonthCellInfo>>;

/// Data model representing a single cell in the calendar grid.
class MonthCellInfo implements Equatable {
  final int day;
  final int month;
  final int year;
  final bool isFromThisScope;
  final int cell;
  final int row;
  final int column;
  final bool isToday;

  const MonthCellInfo({
    required this.day,
    required this.month,
    required this.year,
    required this.isFromThisScope,
    required this.cell,
    required this.row,
    required this.column,
    required this.isToday,
  });

  @override
  List<Object?> get props => [
    day,
    month,
    year,
    isFromThisScope,
    cell,
    row,
    column,
    isToday,
  ];

  @override
  bool? get stringify => true;
}
