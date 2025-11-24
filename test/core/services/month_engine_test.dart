import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_recruitment_test/core/extensions/extension_cell_info_mapper.dart';
import 'package:mobile_recruitment_test/core/services/month_engine.dart';

void main() {
  group('testing MonthEngine funcTionalities', () {
    late MonthEngine monthEngine;

    setUp(() {
      monthEngine = MonthEngine();
    });

    group('testing getMonthCalendar function', () {
      test(
        'should return a calendar with exactly 42 cells (6 rows × 7 columns)',
        () {
          // Arrange
          final date = DateTime(2024, 7, 15);

          // Act
          final result = monthEngine.getMonthCalendar(date);
          // calculate number of cells
          var totalCells = result.values
              .map((e) => e.entries.length)
              .reduce((sum, element) => sum + element);

          // Assert
          expect(totalCells, 42); // should have 42 cells
          expect(result.length, 6); // must hav 6 rows
        },
      );

      test('each row has exactly 7 columns', () {
        // Arrange
        final date = DateTime(2024, 7, 15);

        // Act
        final result = monthEngine.getMonthCalendar(date);

        // Assert
        for (var i = 0; i < 6; i++) {
          expect(result[i]?.length, 7);
        }
      });

      test('check if all days of the current month are included', () {
        // Arrange
        final date = DateTime(2024, 7, 15); // july has 31 days

        // Act
        final result = monthEngine.getMonthCalendar(date);
        // extractng days of current month (isFronThisScope = true)
        final currentMonthDays =
            result
                .toMonthCellInfoList() // reduced it to list of MonthCellInfo
                .where(
                  (e) => e.isFromThisScope,
                ) // filters out only current month
                .map((e) => e.day) // extract day
                .toList();

        // Assert
        expect(currentMonthDays.length, 31);
        expect(currentMonthDays.toSet().length, 31);
        // Check all days from 1 to 31 are present
        for (var day = 1; day <= 31; day++) {
          expect(currentMonthDays.contains(day), true);
        }
      });

      test(
        'check current month and other months days with isFromThisScope',
        () {
          // Arrange
          final date = DateTime(2024, 11, 15);

          // Act
          final result = monthEngine.getMonthCalendar(date);
          final currentMonthDays = result.toMonthCellInfoList().where(
            (e) => e.month == 11 && e.year == 2024 && e.isFromThisScope,
          );
          final otherMonthDays = result.toMonthCellInfoList().where(
            (e) => e.month != 11 && !e.isFromThisScope,
          );

          // Assert
          expect(currentMonthDays.length, 30); // November has 30 days
          expect(otherMonthDays.length, 12); // 42 - 30 = 12 other month days
        },
      );

      test('handles month starting on Monday (no previous month offset)', () {
        // Arrange
        final date = DateTime(2024, 7, 1); // July 2024 starts on Monday

        // Act
        final result = monthEngine.getMonthCalendar(date);

        // Assert
        // First cell should be July 1st
        final firstCell = result[0]![0]!;
        expect(firstCell.day, 1);
        expect(firstCell.month, 7);
        expect(firstCell.isFromThisScope, true);
      });

      test(
        'handles month starting on Sunday (maximum previous month offset)',
        () {
          // Arrange
          final date = DateTime(2024, 9, 1); // September 2024 starts on Sunday

          // Act
          final result = monthEngine.getMonthCalendar(date);

          // Assert
          // First 6 cells should be from august
          for (var col = 0; col < 6; col++) {
            final cell = result[0]![col]!;
            expect(cell.month, 8);
            expect(cell.isFromThisScope, false);
          }

          // 7th cell should be September 1st
          final firstSeptCell = result[0]![6]!;
          expect(firstSeptCell.day, 1);
          expect(firstSeptCell.month, 9);
          expect(firstSeptCell.isFromThisScope, true);
        },
      );

      test('marks today correctly when date is today', () {
        // Arrange
        final today = DateTime.now();

        // Act
        final result = monthEngine.getMonthCalendar(today);

        var todayFound = false;
        for (var row in result.values) {
          for (var cell in row.values) {
            if (cell.day == today.day &&
                cell.month == today.month &&
                cell.year == today.year) {
              expect(cell.isToday, true);
              todayFound = true;
            }
          }
        }

        // Assert
        expect(todayFound, true);
      });

      // additional test to ensure multiple calls work correctly
      test('can be called multiple times with different dates', () {
        // Arrange
        final date1 = DateTime(2024, 1, 15);
        final date2 = DateTime(2024, 7, 20);
        final date3 = DateTime(2023, 12, 10);

        // Act
        final result1 = monthEngine.getMonthCalendar(date1);
        final result2 = monthEngine.getMonthCalendar(date2);
        final result3 = monthEngine.getMonthCalendar(date3);

        // Assert
        expect(result1.toMonthCellInfoList().length, 42);
        expect(result2.toMonthCellInfoList().length, 42);
        expect(result3.toMonthCellInfoList().length, 42);

        // Results should be independent
        expect(result1 == result2, false);
        expect(result2 == result3, false);
      });
    });
  });
}
