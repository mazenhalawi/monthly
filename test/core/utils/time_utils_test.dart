import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_recruitment_test/core/utils/time_utils.dart';

void main() {
  group('testing TimeUtils helper functions', () {
    group('tsting isToday', () {
      test("returns true for today's date", () {
        // Arrange
        final today = DateTime.now();

        // Act
        final result = TimeUtils.isToday(today);

        // Assert
        expect(result, true);
      });

      test('returns false for yesterday', () {
        // Arrange
        final yesterday = DateTime.now().subtract(const Duration(days: 1));

        // Act
        final result = TimeUtils.isToday(yesterday);

        // Assert
        expect(result, false);
      });

      test('returns false for tomorrow', () {
        // Arrange
        final tomorrow = DateTime.now().add(const Duration(days: 1));

        // Act
        final result = TimeUtils.isToday(tomorrow);

        // Assert
        expect(result, false);
      });
    });

    group('testing previousMonth functionality', () {
      test('returns 11 (nov) when month is 12 (december)', () {
        // Arrange
        const month = 12;

        // Act
        final result = TimeUtils.getPreviousMonth(currentMonth: month);

        // Assert
        expect(result, 11);
      });

      test('returns 12 when month is 1 (January)', () {
        // Arrange
        const month = 1;

        // Act
        final result = TimeUtils.getPreviousMonth(currentMonth: month);

        // Assert
        expect(result, 12);
      });
    });

    group('testing nextMonth functionality', () {
      test('returns 1 when month is 12 (December)', () {
        // Arrange
        const month = 12;

        // Act
        final result = TimeUtils.getNextMonth(currentMonth: month);

        // Assert
        expect(result, 1);
      });

      test('returns 2 when month is 1 (January)', () {
        // Arrange
        const month = 1;

        // Act
        final result = TimeUtils.getNextMonth(currentMonth: month);

        // Assert
        expect(result, 2);
      });
    });

    group('testing previousMonthYear function', () {
      test('returns prev year when currentMonth is 1 ', () {
        // Arrange
        const currentMonth = 1; // january
        const currentYear = 2024;

        // Act
        final result = TimeUtils.getPreviousMonthYear(
          currentMonth: currentMonth,
          currentYear: currentYear,
        );

        // Assert
        expect(result, 2023); // should retunr previous year
      });

      test(
        'returns same year when currentMonth is 12 (December going to November)',
        () {
          // Arrange
          const currentMonth = 12; // December
          const currentYear = 2024;

          // Act
          final result = TimeUtils.getPreviousMonthYear(
            currentMonth: currentMonth,
            currentYear: currentYear,
          );

          // Assert
          expect(result, 2024); // Year should stay the same
        },
      );
    });

    group('test nextMonthYear()', () {
      test('returns next year when currentMonth is 12', () {
        // Arrange
        const currentMonth = 12;
        const currentYear = 2024;

        // Act
        final result = TimeUtils.getNextMonthYear(
          currentMonth: currentMonth,
          currentYear: currentYear,
        );

        // Assert
        expect(result, 2025);
      });

      test('returns same year when currentMonth is 1 (jan)', () {
        // Arrange
        const currentMonth = 1; //
        const currentYear = 2024;

        // Act
        final result = TimeUtils.getNextMonthYear(
          currentMonth: currentMonth,
          currentYear: currentYear,
        );

        // Assert
        expect(result, 2024);
      });
    });

    group('test getDaysInMonth()', () {
      test('test days in each month', () {
        // Arrange & Act & Assert
        expect(TimeUtils.getDaysInMonth(year: 2024, month: 1), 31); // January
        expect(
          TimeUtils.getDaysInMonth(year: 2024, month: 2),
          29,
        ); // February leap
        expect(
          TimeUtils.getDaysInMonth(year: 2023, month: 2),
          28,
        ); // February non-leap
        expect(TimeUtils.getDaysInMonth(year: 2024, month: 3), 31); // March
        expect(TimeUtils.getDaysInMonth(year: 2024, month: 4), 30); // April
        expect(TimeUtils.getDaysInMonth(year: 2024, month: 5), 31); // May
        expect(TimeUtils.getDaysInMonth(year: 2024, month: 6), 30); // June
        expect(TimeUtils.getDaysInMonth(year: 2024, month: 7), 31); // July
        expect(TimeUtils.getDaysInMonth(year: 2024, month: 8), 31); // August
        expect(TimeUtils.getDaysInMonth(year: 2024, month: 9), 30); // September
        expect(TimeUtils.getDaysInMonth(year: 2024, month: 10), 31); // October
        expect(TimeUtils.getDaysInMonth(year: 2024, month: 11), 30); // November
        expect(TimeUtils.getDaysInMonth(year: 2024, month: 12), 31); // December
      });
    });

    group('testing previousMonthDays()', () {
      test('returns 31 days when previousMonth is December (12)', () {
        // Arrange
        const year = 2024;
        const previousMonth = 12;

        // Act
        final result = TimeUtils.getPreviousMonthDays(
          previousYear: year,
          previousMonth: previousMonth,
        );

        // Assert
        expect(result, 31);
      });

      test('returns 29 days for February in leap year', () {
        // Arrange
        const year = 2024;
        const previousMonth = 2;

        // Act
        final result = TimeUtils.getPreviousMonthDays(
          previousYear: year,
          previousMonth: previousMonth,
        );

        // Assert
        expect(result, 29); // February 2024 has 29 days (leap year)
      });

      test('returns 28 days for February in non-leap year', () {
        // Arrange
        const year = 2023;
        const previousMonth = 2;

        // Act
        final result = TimeUtils.getPreviousMonthDays(
          previousYear: year,
          previousMonth: previousMonth,
        );

        // Assert
        expect(result, 28);
      });
    });

    group('daysOffsetPreviousMonthQuantity', () {
      test('should return 0 when month starts on Monday', () {
        // Arrange
        const year = 2024;
        const month = 7; // July 2024 starts on Monday

        // Act
        final result = TimeUtils.daysOffsetPreviousMonthQuantity(
          year: year,
          month: month,
        );

        // Assert
        expect(result, 0);
      });

      test('should return 6 when month starts on Sunday', () {
        // Arrange
        const year = 2024;
        const month = 9; // September 2024 starts on Sunday

        // Act
        final result = TimeUtils.daysOffsetPreviousMonthQuantity(
          year: year,
          month: month,
        );

        // Assert
        expect(result, 6);
      });
    });

    group('daysOffSetsPreviousMonth', () {
      test('returns last number of days in ascending order', () {
        // Arrange
        const previousMonthDays = 31;
        const dayOffSet = 3;

        // Act
        final result = TimeUtils.daysOffSetsPreviousMonth(
          previousMonthDays: previousMonthDays,
          dayOffSet: dayOffSet,
        );

        // Assert
        expect(result.length, 3);
        expect(result[0], 29);
        expect(result[1], 30);
        expect(result[2], 31);
      });

      test('returns empty list for offset of 0', () {
        // Arrange
        const previousMonthDays = 31;
        const dayOffSet = 0;

        // Act
        final result = TimeUtils.daysOffSetsPreviousMonth(
          previousMonthDays: previousMonthDays,
          dayOffSet: dayOffSet,
        );

        // Assert
        expect(result, isEmpty);
      });
    });
  });
}
