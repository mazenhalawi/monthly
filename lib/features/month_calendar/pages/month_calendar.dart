import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_recruitment_test/core/errors/failure.dart';
import 'package:mobile_recruitment_test/core/utils/colors.dart';
import 'package:mobile_recruitment_test/core/utils/styles.dart';
import 'package:mobile_recruitment_test/core/widgets/alert_box.dart';
import 'package:mobile_recruitment_test/core/widgets/failure_widget.dart';
import 'package:mobile_recruitment_test/features/month_calendar/bloc/month_bloc.dart';
import 'package:mobile_recruitment_test/features/month_calendar/models/month_data.dart';
import 'package:mobile_recruitment_test/features/month_calendar/models/month_engine_data.dart';
import 'package:mobile_recruitment_test/core/widgets/text.dart';
import 'package:mobile_recruitment_test/core/utils/translations.dart';

/// Main calendar widget that displays a monthly calendar view.
class MonthCalendar extends StatelessWidget {
  const MonthCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MonthBloc, MonthState>(
        listenWhen: (prev, curr) => curr.isListenerState,
        buildWhen: (prev, curr) => !curr.isListenerState,
        listener: (context, state) {
          state.maybeWhen(
            displayAlert:
                (title, message, data, shouldPopOut, isListenerState) =>
                    AlertBox(title: title, message: message)
                        .show(context)
                        .then(
                          (value) =>
                              shouldPopOut && context.mounted
                                  ? Navigator.of(context).pop()
                                  : null,
                        ),
            orElse:
                () =>
                    throw UnimplementedError(
                      '$state was not implemented in the listener of $this',
                    ),
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            initial: (data, _) => _getInitialState(context),
            loading:
                (data, _) => _getLoadingState(context: context, data: data),
            loadFailure:
                (failure, retryAction, data, _) => _getLoadFailureState(
                  context: context,
                  failure: failure,
                  retryAction: retryAction,
                ),
            loadSuccess:
                (data, _) => _getLoadSuccessState(context: context, data: data),
            orElse:
                () =>
                    throw UnimplementedError(
                      '$state was not implemented in the builder of $this',
                    ),
          );
        },
      ),
    );
  }
}

extension StateWidgets on MonthCalendar {
  Widget _getInitialState(BuildContext context) {
    context.read<MonthBloc>().add(MonthEvent.getMonth());
    return Container();
  }

  Widget _getLoadingState({required BuildContext context, MonthData? data}) {
    return Center(child: CircularProgressIndicator());
  }

  Widget _getLoadFailureState({
    required BuildContext context,
    required Failure failure,
    required MonthEvent retryAction,
  }) {
    return FailureWidget(
      failure: failure,
      onRetryPressed: () => context.read<MonthBloc>().add(retryAction),
    );
  }

  Widget _getLoadSuccessState({
    required BuildContext context,
    required MonthData data,
  }) {
    return data.month.isEmpty
        ? const SizedBox()
        : Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: LText(
                    text: Translations.monthsMap[data.selectedPeriod.month]!,
                    type: LTextType.medium,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    KMonthEngine.columnCount,
                    (index) => Container(
                      width: 50.0,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: LText(
                        text: Translations.weekdayMap[index + 1]!,
                        type: LTextType.medium,
                      ),
                    ),
                  ),
                ),
                ...List.generate(
                  KMonthEngine.rowCount,
                  (rowIndex) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      KMonthEngine.columnCount,
                      (columnIdx) => SizedBox(
                        width: 50.0,
                        height: 80.0,
                        child:
                            data.month[rowIndex]![columnIdx]!.isFromThisScope
                                ? Container(
                                  alignment: Alignment.topCenter,
                                  color: LColors.shade1,
                                  child: LText(
                                    text:
                                        data.month[rowIndex]![columnIdx]!.day
                                            .toString(),
                                    type: LTextType.small,
                                    fontWeight:
                                        data
                                                .month[rowIndex]![columnIdx]!
                                                .isToday
                                            ? FontWeight.bold
                                            : null,
                                  ),
                                )
                                : null,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () => log('pressed previous'),
                          style: LButtonStyle,
                          child: Text("Button"),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () => log('pressed next'),
                          style: LButtonStyle,
                          child: Text("Next"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
