import 'package:flutter/material.dart';

/// Utility class for date and time calculations used in calendar generation.
class TimeUtils {
  TimeUtils._();

  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return now.day == date.day &&
        now.month == date.month &&
        now.year == date.year;
  }

  static int getPreviousMonth({required int currentMonth}) {
    return currentMonth == 1 ? 12 : currentMonth - 1;
  }

  static int getPreviousMonthDays({
    required int previousMonth,
    required int previousYear,
  }) {
    var year_ = previousYear;
    var month_ = previousMonth;
    if (previousMonth == 1) {
      year_--;
      month_ = 12;
    }
    return DateUtils.getDaysInMonth(year_, month_);
  }

  static int getPreviousMonthYear({
    required int currentMonth,
    required int currentYear,
  }) {
    return currentMonth == 1 ? currentYear - 1 : currentYear;
  }

  static int daysOffsetPreviousMonthQuantity({
    required int year,
    required int month,
  }) {
    return DateTime(year, month).weekday - 1;
  }

  // gets the list of day numbers from the previous month to fill the offset
  static List<int> daysOffSetsPreviousMonth({
    required int previousMonthDays,
    required int dayOffSet,
  }) {
    final prevMonthDays = List.generate(
      previousMonthDays,
      (index) => index + 1,
    );

    final offset_ = prevMonthDays.reversed.take(dayOffSet).toList().reversed.toList();

    return offset_;

    /* var offsets = <int>[];
    var counter = dayOffSet;
    var previousDays = previousMonthDays;

    while (counter > 0) {
      offsets.add(previousDays);
      previousDays--;
      counter--;
    }

    return offsets.reversed.toList(); */
  }

  static int getNextMonth({required int currentMonth}) {
    return currentMonth == 12 ? 1 : currentMonth + 1;
  }

  static int getNextMonthYear({
    required int currentMonth,
    required int currentYear,
  }) {
    return currentMonth == 12 ? currentYear + 1 : currentYear;
  }

  static int getDaysInMonth({required int year, required int month}) {
    return DateUtils.getDaysInMonth(year, month);
  }
}
