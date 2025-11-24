import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_recruitment_test/core/services/month_engine.dart';
import 'package:mobile_recruitment_test/features/month_calendar/bloc/month_bloc.dart';

void main() {
  group('testing MonthBloc events', () {
    late MonthEngine mockEngine;

    setUp(() {
      mockEngine = MonthEngine();
    });

    test('initial state is MonthStateInitial with current date', () {
      // Arrange
      final bloc = MonthBloc(engine: mockEngine);

      // Act
      final state = bloc.state;

      // Assert
      expect(state, isA<MonthStateInitial>());
      expect(state.data.selectedPeriod.month, DateTime.now().month);
      expect(state.data.selectedPeriod.year, DateTime.now().year);
    });

    group('MonthEventGetMonthCalendar', () {
      blocTest<MonthBloc, MonthState>(
        'should emits loading then loadSuccess when getMonthCalendar is fired',
        // Arrange
        build: () => MonthBloc(engine: mockEngine),
        // Act
        act: (bloc) => bloc.add(const MonthEvent.getMonthCalendar()),
        // Assert
        expect:
            () => [
              isA<MonthStateLoading>(),
              isA<MonthStateLoadSuccess>().having(
                (state) => state.data.month.isEmpty,
                'has month data',
                false,
              ),
            ],
      );

      blocTest<MonthBloc, MonthState>(
        'loads calendar for the currently selected period',
        // Arrange
        build: () {
          final bloc = MonthBloc(engine: mockEngine);
          // Set a specific date
          final testDate = DateTime(2024, 7, 15);
          bloc.add(MonthEvent.setDate(testDate));
          return bloc;
        },
        // Act
        act: (bloc) => bloc.add(const MonthEvent.getMonthCalendar()),
        skip: 1, // Skip states emited when setDate was fired
        // Assert
        expect:
            () => [
              isA<MonthStateLoading>(),
              isA<MonthStateLoadSuccess>()
                  .having(
                    (state) => state.data.selectedPeriod.month,
                    'selected month',
                    7,
                  )
                  .having(
                    (state) => state.data.selectedPeriod.year,
                    'selected year',
                    2024,
                  )
                  .having(
                    (state) => state.data.month.isNotEmpty,
                    'month is not empty',
                    true,
                  ),
            ],
      );
    });

    group('testing MonthEventGetNextMonthCalendar event', () {
      blocTest<MonthBloc, MonthState>(
        'should emit loading then loadSuccess with subsequent month when gotoNextMonth is fired',
        // Arrange
        build: () {
          final bloc = MonthBloc(engine: mockEngine);
          bloc.add(MonthEvent.setDate(DateTime(2024, 6, 15)));
          return bloc;
        },
        // Act
        act: (bloc) => bloc.add(const MonthEvent.gotoNextMonth()),
        skip: 1, // Skip states emited when setDate was fired
        // Assert
        expect:
            () => [
              isA<MonthStateLoading>().having(
                (state) => state.data.selectedPeriod.month,
                'current month before transition',
                6,
              ),
              isA<MonthStateLoadSuccess>()
                  .having(
                    (state) => state.data.selectedPeriod.month,
                    'next month',
                    7,
                  )
                  .having(
                    (state) => state.data.selectedPeriod.year,
                    'same year',
                    2024,
                  ),
            ],
      );

      blocTest<MonthBloc, MonthState>(
        'can navigate multiple months forward including year transition',
        // Arrange
        build: () {
          final bloc = MonthBloc(engine: mockEngine);
          bloc.add(MonthEvent.setDate(DateTime(2024, 12, 15)));
          return bloc;
        },
        // Act
        act: (bloc) {
          bloc.add(const MonthEvent.gotoNextMonth());
          bloc.add(const MonthEvent.gotoNextMonth());
          bloc.add(const MonthEvent.gotoNextMonth());
        },
        skip: 1,
        // Assert
        expect:
            () => [
              isA<MonthStateLoading>(),
              isA<MonthStateLoadSuccess>()
                  .having(
                    (state) => state.data.selectedPeriod.month,
                    'month',
                    1,
                  )
                  .having(
                    (state) => state.data.selectedPeriod.year,
                    'year should increment',
                    2025,
                  ),
              isA<MonthStateLoading>(),
              isA<MonthStateLoadSuccess>()
                  .having(
                    (state) => state.data.selectedPeriod.month,
                    'month',
                    2,
                  )
                  .having(
                    (state) => state.data.selectedPeriod.year,
                    'year should increment',
                    2025,
                  ),
              isA<MonthStateLoading>(),
              isA<MonthStateLoadSuccess>()
                  .having(
                    (state) => state.data.selectedPeriod.month,
                    'month',
                    3,
                  )
                  .having(
                    (state) => state.data.selectedPeriod.year,
                    'year should increment',
                    2025,
                  ),
            ],
      );
    });

    group('MonthEventGetPreviousMonthCalendar', () {
      blocTest<MonthBloc, MonthState>(
        'should emit loading then loadSuccess with previous month when gotoPreviousMonth is added',
        // Arrange
        build: () {
          final bloc = MonthBloc(engine: mockEngine);
          bloc.add(MonthEvent.setDate(DateTime(2024, 6, 15)));
          return bloc;
        },
        // Act
        act: (bloc) => bloc.add(const MonthEvent.gotoPreviousMonth()),
        skip: 1,
        // Assert
        expect:
            () => [
              isA<MonthStateLoading>().having(
                (state) => state.data.selectedPeriod.month,
                'current month before transition',
                6,
              ),
              isA<MonthStateLoadSuccess>()
                  .having(
                    (state) => state.data.selectedPeriod.month,
                    'previous month',
                    5,
                  )
                  .having(
                    (state) => state.data.selectedPeriod.year,
                    'same year',
                    2024,
                  ),
            ],
      );

      blocTest<MonthBloc, MonthState>(
        'correctly transitions from January to December with year decrement',
        // Arrange
        build: () {
          final bloc = MonthBloc(engine: mockEngine);
          bloc.add(MonthEvent.setDate(DateTime(2024, 1, 15)));
          return bloc;
        },
        // Act
        act: (bloc) => bloc.add(const MonthEvent.gotoPreviousMonth()),
        skip: 1,
        // Assert
        verify: (bloc) {
          final state = bloc.state as MonthStateLoadSuccess;
          expect(state.data.selectedPeriod.month, 12); // December
          expect(state.data.selectedPeriod.year, 2023);
        },
      );

      blocTest<MonthBloc, MonthState>(
        'can navigate multiple months backward',
        // Arrange
        build: () {
          final bloc = MonthBloc(engine: mockEngine);
          bloc.add(MonthEvent.setDate(DateTime(2024, 6, 15)));
          return bloc;
        },
        // Act
        act: (bloc) {
          bloc.add(const MonthEvent.gotoPreviousMonth());
          bloc.add(const MonthEvent.gotoPreviousMonth());
          bloc.add(const MonthEvent.gotoPreviousMonth());
        },
        skip: 1,
        // Assert
        expect:
            () => [
              isA<MonthStateLoading>(),
              isA<MonthStateLoadSuccess>().having(
                (state) => state.data.selectedPeriod.month,
                'month',
                5,
              ),
              isA<MonthStateLoading>(),
              isA<MonthStateLoadSuccess>().having(
                (state) => state.data.selectedPeriod.month,
                'month',
                4,
              ),
              isA<MonthStateLoading>(),
              isA<MonthStateLoadSuccess>().having(
                (state) => state.data.selectedPeriod.month,
                'month',
                3,
              ),
            ],
      );
    });

    group('testing MonthEventSetDate', () {
      blocTest<MonthBloc, MonthState>(
        'updates selectedPeriod without loading state',
        // Arrange
        build: () => MonthBloc(engine: mockEngine),
        // Act
        act: (bloc) {
          final newDate = DateTime(2025, 3, 20);
          bloc.add(MonthEvent.setDate(newDate));
        },
        // Assert
        expect:
            () => [
              isA<MonthStateInitial>()
                  .having(
                    (state) => state.data.selectedPeriod.month,
                    'month',
                    3,
                  )
                  .having(
                    (state) => state.data.selectedPeriod.year,
                    'year',
                    2025,
                  )
                  .having((state) => state.data.selectedPeriod.day, 'day', 20),
            ],
      );

      blocTest<MonthBloc, MonthState>(
        'preserves state type when setting date',
        // Arrange
        build: () {
          final bloc = MonthBloc(engine: mockEngine);
          bloc.add(const MonthEvent.getMonthCalendar());
          return bloc;
        },
        // Act
        act: (bloc) {
          final newDate = DateTime(2024, 8, 10);
          bloc.add(MonthEvent.setDate(newDate));
        },
        skip: 2,
        // Assert
        expect:
            () => [
              isA<MonthStateLoadSuccess>().having(
                (state) => state.data.selectedPeriod.month,
                'month changed',
                8,
              ),
            ],
      );
    });
  });
}
