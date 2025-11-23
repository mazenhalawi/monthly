import 'package:flutter/cupertino.dart';
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
class MonthCalendarPage extends StatelessWidget {
  const MonthCalendarPage({super.key});

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

extension StateWidgets on MonthCalendarPage {
  Widget _getInitialState(BuildContext context) {
    context.read<MonthBloc>().add(MonthEvent.getMonthCalendar());
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
                  child: GestureDetector(
                    onTap: () {
                      DateTime? selectedDate;
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: 300,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 20,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed:
                                            () => Navigator.of(
                                              context,
                                            ).pop(false),
                                        child: Text("Cancel"),
                                      ),
                                      TextButton(
                                        onPressed:
                                            () =>
                                                Navigator.of(context).pop(true),
                                        child: Text("Submit"),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 200,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.monthYear,
                                    initialDateTime: DateTime(
                                      data.selectedPeriod.year,
                                      data.selectedPeriod.month,
                                    ),
                                    minimumYear: 1900,
                                    maximumYear: 2100,
                                    onDateTimeChanged: (DateTime newDateTime) {
                                      selectedDate = newDateTime;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ).then((shouldSubmit) {
                        if (context.mounted &&
                            shouldSubmit == true &&
                            selectedDate != null) {
                          context.read<MonthBloc>()
                            ..add(MonthEvent.setDate(selectedDate!))
                            ..add(MonthEvent.getMonthCalendar());
                        }
                        print(
                          'selectedDate: ${selectedDate?.toIso8601String()}',
                        );
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LText(
                          text:
                              Translations.monthsMap[data
                                  .selectedPeriod
                                  .month]!,
                          type: LTextType.medium,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.edit, size: 16, color: LColors.brand),
                      ],
                    ),
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
                            data.month[rowIndex]?[columnIdx]?.isFromThisScope ??
                                    false
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
                        width: 110,
                        child: ElevatedButton(
                          onPressed:
                              () => context.read<MonthBloc>().add(
                                MonthEvent.gotoPreviousMonth(),
                              ),
                          style: LButtonStyle,
                          child: Text("Previous"),
                        ),
                      ),
                      SizedBox(
                        width: 110,
                        child: ElevatedButton(
                          onPressed:
                              () => context.read<MonthBloc>().add(
                                MonthEvent.gotoNextMonth(),
                              ),
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
